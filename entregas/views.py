from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.views import View
from django.core.exceptions import PermissionDenied
from .forms import MotoristaLoginForm, MotoristaRegisterForm
from .decorators import motorista_required


def index(request):
    return render(request, 'entregas/index.html')


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
        

