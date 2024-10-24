import os

def get_image_path(instance, filename, folder):
    """
    Gera o caminho para a imagem com base no tipo da instância (Produto, Loja, etc).
    
    Args:
        instance: A instância do modelo (Produto, Loja, etc).
        filename: O nome original do arquivo de upload.
        folder: O nome da pasta onde a imagem será salva (e.g., 'produtos', 'logos').
    
    Returns:
        O caminho completo para onde a imagem será salva.
    """
    # Extrai a extensão do arquivo original
    ext = filename.split('.')[-1]
    
    # Define o nome do arquivo com o ID da instância formatado
    filename = f"{instance.__class__.__name__.lower()}{instance.id:06d}.{ext}"
    
    # Retorna o caminho completo com o diretório especificado
    return os.path.join(folder, filename)
