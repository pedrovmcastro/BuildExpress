from ecommerce.models import Pedido, UsuarioComum

usuario = UsuarioComum.objects.get(email="pedro@email.com")
Pedido.objects.filter(user=usuario).delete()



