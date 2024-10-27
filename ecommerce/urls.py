from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("login", views.login_view, name="login"),
    path("logout", views.logout_view, name="logout"),
    path("register", views.register, name="register"),
    path("categorias", views.categorias, name="categorias"),
    path("categorias/<int:id_categoria>", views.produtos_categoria, name="produtos_categoria"),
    path("lojas", views.lojas, name="lojas"),
    path("lojas/<int:id_loja>", views.produtos_loja, name="produtos_loja"),
    path("produto/<int:id_produto>", views.detalhes_produto, name="detalhes_produto"),
    path("wishlist", views.wishlist, name="wishlist"),
    path("produto/<int:id_produto>/acionar_wishlist", views.acionar_wishlist, name="acionar_wishlist")
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)