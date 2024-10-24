import os

def rename_image(instance, filename):
    """
    Renomeia o arquivo de imagem baseado no nome da classe do modelo e no ID do objeto.
    Exemplo: 'Produto000001.jpg' para a model Produto com ID 1, salvando em 'produtos/'.
    """
    # Obtém a extensão do arquivo
    ext = os.path.splitext(filename)[1]
    
    # Garante que o objeto tenha um ID
    if instance.id:
        # Nome do arquivo com base no nome da classe e ID formatado
        new_filename = f"{instance.__class__.__name__}{str(instance.id).zfill(6)}{ext}"
        
        # Define a subpasta (ex: 'produtos/')
        subfolder = instance.__class__.__name__.lower() + "s/"
        
        # Retorna o caminho completo para o diretório desejado
        return os.path.join(subfolder, new_filename)
    else:
        # Se o objeto ainda não tiver um ID, retorna o nome original com a subpasta
        subfolder = instance.__class__.__name__.lower() + "s/"
        return os.path.join(subfolder, filename)