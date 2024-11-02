from django.contrib.auth.backends import BaseBackend
from .models import Lojista


class LojistaBackend(BaseBackend):
    def authenticate(self, request, email=None, password=None, **kwargs):
        try:
            user = Lojista.objects.get(email=email)
            if user.check_password(password):
                print("Lojista autenticado:", user)
                return user
        except Lojista.DoesNotExist:
            return None