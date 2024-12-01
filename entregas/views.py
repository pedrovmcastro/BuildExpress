from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.views import View
from django.core.exceptions import PermissionDenied
from geopy.geocoders import Nominatim

from .forms import MotoristaLoginForm, MotoristaRegisterForm
from .decorators import motorista_required
from .models import Entrega, EntregaRecusada, EntregaCanceladaPeloMotorista


def index(request):
    if request.user.is_authenticated and request.user.is_motorista:
        # ENTREGA
        entrega = Entrega.objects.filter(status='pedido preparado',
                                         entrega_pelo_app=True,
                                         is_active=True
                                         ).exclude(
                                             id__in=EntregaRecusada.objects.filter(
                                                 motorista=request.user
                                             ).values_list('entrega_id', flat=True)
                                         ).exclude(
                                             id__in=EntregaCanceladaPeloMotorista.objects.filter(
                                                 motorista=request.user
                                             ).values_list('entrega_id', flat=True)
                                         ).order_by('-datetime'
                                         ).first()

        # ENTREGA ACEITA
        entrega_aceita = Entrega.objects.filter(motorista=request.user).order_by('-datetime').exclude(status='entregue').first()
        if entrega_aceita:
            entrega = entrega_aceita

        # NENHUMA ENTREGA
        if not entrega:
            messages.info(request, "Nenhuma entrega em sua localização")
            return render(request, 'entregas/index.html')
        
        return render(request, 'entregas/index.html', {
            'loja': entrega.endereco_loja.loja_set.first(),
            'entrega': entrega,
            'entrega_aceita': entrega_aceita,
        })

    return MotoristaLoginView.as_view()
    

class MotoristaLoginView(View):
    def get(self, request):

        if request.user.is_authenticated and request.user.is_motorista:
            return redirect('entregas:index')

        form = MotoristaLoginForm()
        return render(request, "entregas/login.html", {
            "form": form
        })

    def post(self, request):
        form = MotoristaLoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = authenticate(request, email=email, password=password)
            if user:
                login(request, user)
                return redirect('entregas:index')
            
        return render(request, "entregas/login.html", {
            "form": form,
            "error": "Usuário e/ou senha inválidos"
        })


class MotoristaLogoutView(View):
    def dispatch(self, request, *args, **kwargs):
        # Verifique se o usuário está autenticado e se é um motorista
        if not request.user.is_authenticated or not request.user.is_motorista:
            raise PermissionDenied  # Retorna erro 403 se não for um motorista
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        logout(request)
        return redirect("entregas:motorista_login")
    

class MotoristaRegisterView(View):
    def get(self, request):
        form = MotoristaRegisterForm()
        return render(request, "entregas/register.html", {
            "form": form
        })
    
    def post(self, request):
        form = MotoristaRegisterForm(request.POST)

        if form.is_valid():
            form.save()
            return redirect("entregas:motorista_login")
        
        return render(request, "entregas/register.html", {
            "form": form
        })


@motorista_required
def recusar_entrega(request, id_entrega):
    entrega = get_object_or_404(Entrega, id=id_entrega)

    _, created = EntregaRecusada.objects.get_or_create(entrega=entrega, motorista=request.user)

    if created:
        request.user.entregas_recusadas += 1
        request.user.save()

    return redirect('entregas:index')


@motorista_required
def aceitar_entrega(request, id_entrega):
    entrega = get_object_or_404(Entrega, id=id_entrega)
    entrega.motorista = request.user
    entrega.status = 'a caminho da loja'
    entrega.save()

    return redirect('entregas:index')


@motorista_required
def cancelar_entrega(request, id_entrega):
    entrega = get_object_or_404(Entrega, id=id_entrega)

    if entrega.motorista == request.user:
        entrega.motorista = None
        entrega.status = 'preparando o pedido'
        entrega.save()

        _, created = EntregaCanceladaPeloMotorista.objects.get_or_create(entrega=entrega, motorista=request.user)

        if created:
            request.user.entregas_canceladas += 1
            request.user.save()

        return redirect('entregas:index')
    else:
        return PermissionDenied


@motorista_required
def realizar_entrega(request, id_entrega):
    entrega = get_object_or_404(Entrega, id=id_entrega)

    if entrega.motorista != request.user:
        raise PermissionDenied

    if request.method == "POST":       
        codigo = request.POST.get('codigo_entrega', '').strip()

        if codigo and codigo == entrega.pedido.user.codigo_de_entrega():
            entrega.status = 'entregue'
            entrega.save()
            request.user.entregas_realizadas += 1
            request.user.save()
            return redirect('entregas:index')
        else:
            messages.error(request, "Código incorreto")
            return redirect('entregas:index')
    
    return redirect('entregas:index')



