from django.urls import path
from . import views

app_name = 'entregas'

urlpatterns = [
    path("", views.index, name='index'),
    path("login/", views.MotoristaLoginView.as_view(), name="motorista_login"),
    path("logout/", views.MotoristaLogoutView.as_view(), name="motorista_logout"),
    path("register/", views.MotoristaRegisterView.as_view(), name="registrar_motorista"),
]

