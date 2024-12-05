from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

app_name = 'ecommerce'

urlpatterns = [
    path("", views.index, name="index"),
    path("login", views.UsuarioComumLoginView.as_view(), name="login"),
    path("logout", views.UsuarioComumLogoutView.as_view(), name="logout"),
    path("register", views.register, name="register"),
    path("categorias", views.categorias, name="categorias"),
    path("categorias/<int:id_categoria>", views.produtos_categoria, name="produtos_categoria"),
    path("lojas", views.lojas, name="lojas"),
    path("lojas/<int:id_loja>", views.produtos_loja, name="produtos_loja"),
    path("produto/<int:id_produto>", views.detalhes_produto, name="detalhes_produto"),
    path("wishlist", views.wishlist, name="wishlist"),
    path("produto/<int:id_produto>/acionar_wishlist", views.acionar_wishlist, name="acionar_wishlist"),
    path("produto/<int:id_produto>/<int:id_avaliacao>/deletar", views.deletar_avaliacao, name="deletar_avaliacao"), # alguem poderia acessar a view pela url, ou seja deletar um item que em teoria não teria acesso
    path('carrinho', views.carrinho, name="carrinho"),
    path("carrinho/<int:id_produto>/adicionar", views.adicionar_ao_carrinho, name="adicionar_ao_carrinho"),
    path("carrinho/<int:id_produto>/remover", views.remover_do_carrinho, name="remover_do_carrinho"),
    path("carrinho/<int:id_carrinho>/abandonar", views.abandonar_carrinho, name="abandonar_carrinho"),
    path("carrinho/<int:id_carrinho>/finalizar", views.finalizar_carrinho, name="finalizar_carrinho"),
    path("checkout/selecao-enderecos", views.exibir_enderecos, name="exibir_enderecos"),
    path("checkout/selecao-enderecos/<int:id_endereco>/selecionar", views.selecionar_endereco, name="selecionar_endereco"),
    path("checkout/adicionar-endereco", views.adicionar_endereco, name="adicionar_endereco"),
    path("checkout/confirmacao-pedido", views.confirmar_pedido, name="confirmar_pedido"),
    path("checkout/confirmacao-pedido/aplicar-cupom", views.aplicar_cupom, name="aplicar_cupom"),
    path("checkout/confirmacao-pedido/forma-entrega", views.forma_de_entrega, name="forma_de_entrega"),
    path("checkout/confirmacao-pedido/<int:id_pedido>/cancelar", views.cancelar_pedido, name="cancelar_pedido"),
    path("pedidos", views.meus_pedidos, name="meus_pedidos"),
    path('pedido/avaliar/<int:id_entrega>/', views.avaliar_entrega, name="avaliar_entrega"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
