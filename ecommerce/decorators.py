from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import login_required
from functools import wraps


def usuario_comum_required(view_func):
    @wraps(view_func)
    @login_required  # Garantir que o usuário esteja logado
    def _wrapped_view(request, *args, **kwargs):
        if not request.user.is_lojista and not request.user.is_motorista:
            return view_func(request, *args, **kwargs)
        else:
            raise PermissionDenied  # Retorna erro 403 se não for um usuário comum
    return _wrapped_view