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
    path("cadastro_produto", views.cadastrar_produto, name="cadastrar_produto"),
    path("produto/<int:id_produto>", views.pagina_produto, name="pagina_produto"),
    path("produto/<int:id_produto>/editar", views.editar_produto, name="editar_produto"),
    path("produto/<int:id_produto>/deletar", views.deletar_produto, name="deletar_produto"),
    path("loja", views.configurar_loja, name="loja"),
    path("preparar_pedido/<int:id_entrega>", views.preparar_pedido, name="preparar_pedido"),
    path("acionar_entrega/<int:id_entrega>", views.acionar_entrega, name="acionar_entrega"),
    path("saiu_para_entrega/<int:id_entrega>", views.saiu_para_entrega, name="saiu_para_entrega")
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    