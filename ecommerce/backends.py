from django.contrib.auth.backends import BaseBackend
from .models import UsuarioComum

class UsuarioComumBackend(BaseBackend):
    def authenticate(self, request, email=None, password=None, **kwargs):
        try:
            user = UsuarioComum.objects.get(email=email)
            if user.check_password(password):
                return user
        except UsuarioComum.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return UsuarioComum.objects.get(pk=user_id)
        except UsuarioComum.DoesNotExist:
            return None
