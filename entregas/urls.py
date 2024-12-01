from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import MotoristaLoginView, MotoristaLogoutView, MotoristaRegisterView, index, aceitar_entrega, recusar_entrega, cancelar_entrega, realizar_entrega

app_name = 'entregas'

urlpatterns = [
    path("", index, name='index'),
    path("login/", MotoristaLoginView.as_view(), name="motorista_login"),
    path("logout/", MotoristaLogoutView.as_view(), name="motorista_logout"),
    path("register/", MotoristaRegisterView.as_view(), name="registrar_motorista"),
    path("<int:id_entrega>/aceitar", aceitar_entrega, name="aceitar_entrega"),
    path("<int:id_entrega>/recusar", recusar_entrega, name="recusar_entrega"),
    path("<int:id_entrega>/cancelar", cancelar_entrega, name="cancelar_entrega"),
    path("<int:id_entrega>/finalizar", realizar_entrega, name="realizar_entrega")
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
