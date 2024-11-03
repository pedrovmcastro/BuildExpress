from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import MotoristaLoginView, MotoristaLogoutView, MotoristaRegisterView, index

app_name = 'entregas'

urlpatterns = [
    path("", index, name='index'),
    path("login/", MotoristaLoginView.as_view(), name="motorista_login"),
    path("logout/", MotoristaLogoutView.as_view(), name="motorista_logout"),
    path("register/", MotoristaRegisterView.as_view(), name="registrar_motorista"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
