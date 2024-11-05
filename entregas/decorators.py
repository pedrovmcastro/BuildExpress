from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import login_required
from functools import wraps


def motorista_required(view_func):
    @wraps(view_func)
    @login_required  # Garantir que o usuário esteja logado
    def _wrapped_view(request, *args, **kwargs):
        if request.user.is_motorista:
            return view_func(request, *args, **kwargs)
        else:
            raise PermissionDenied  # Retorna erro 403 se não for um lojista
    return _wrapped_view