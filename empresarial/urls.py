from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

app_name = 'empresarial'

urlpatterns = [
    path("", views.index, name="index"),
    path("login", views.LojistaLoginView.as_view(), name="lojista_login"),
    path("logout", views.LojistaLogoutView.as_view(), name="lojista_logout"),
    path("cadastro/inicio", views.cadastro_inicial, name="cadastro_inicial"),
    path("cadastro/endereco", views.cadastrar_endereco, name="cadastrar_endereco"),
    path("cadastro/responsavel", views.cadastrar_responsavel, name="cadastrar_responsavel"),
    path("cadastro/loja", views.cadastrar_loja, name="cadastrar_loja"),
    path("cadastro/plano", views.cadastrar_plano, name="cadastrar_plano"),
    path("cadastro/senha", views.cadastrar_senha, name="cadastrar_senha"),
    path("cadastro/conclusao", views.concluir_cadastro, name="concluir_cadastro"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    