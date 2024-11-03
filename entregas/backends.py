from django.contrib.auth.backends import BaseBackend
from .models import Motorista


class MotoristaBackend(BaseBackend):
    def authenticate(self, request, email=None, password=None, **kwargs):
        try:
            user = Motorista.objects.get(email=email)
            if user.check_password(password):
                return user
        except Motorista.DoesNotExist:
            return None
        
    def get_user(self, user_id):
        try:
            return Motorista.objects.get(pk=user_id)
        except Motorista.DoesNotExist:
            return None
        

   