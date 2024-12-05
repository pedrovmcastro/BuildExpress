# BuildExpress

## Aplicação Django - E-commerce Multiplataforma

Este é um projeto acadêmico desenvolvido com Django e MySQL, que simula uma plataforma de e-commerce com diferentes tipos de usuários: clientes, lojistas e motoristas. O objetivo principal é implementar funcionalidades completas de autenticação, gerenciamento de lojas e produtos, além de um portal para solicitações de entrega.

## Desenvolvido por

- Pedro Henrique Cezarini
- Pedro Vitor Marques de Castro

## Visão Geral

A aplicação é dividida em três seções principais:

- **E-commerce**: Interface de compra para usuários comuns.
- **Empresarial**: Painel de gerenciamento para lojistas administrarem seus produtos e lojas.
- **Entregas**: Portal de solicitações de entrega gerenciado por motoristas.

Cada seção possui suas próprias tabelas de banco de dados e lógica de autenticação personalizada para evitar conflitos entre os tipos de usuários.

## Funcionalidades Principais

### Usuários Comuns (E-commerce)
- Cadastro e login.
- Navegação por lojas e produtos.
- Adição de produtos ao carrinho (futuramente).
- Sistema de pedidos (futuramente).

### Lojistas (Empresarial)
- Cadastro e login com autenticação personalizada.
- Gerenciamento de produtos:
  - Cadastro, edição e exclusão de produtos.
- Configuração da loja:
  - Upload de logo.
  - Atualização de informações da loja.
- Exibição de produtos em uma interface amigável.
- Gerenciamento dos pedidos.

### Motoristas (Entregas)
- Cadastro e login com autenticação personalizada.
- Recebimento e gerenciamento de solicitações de entrega.

## Requisitos

Certifique-se de ter os seguintes itens instalados:

- **Python 3.10+**
- **Django 4.2+**
- **MySQL 8+**

## Configuração do Ambiente

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/pedrovmcastro/BuildExpress.git
   cd BuildExpress

2. **Crie um ambiente virtual e ative-o:**
    ```bash
    python -m venv venv
    source venv/bin/activate  # No Windows: venv\Scripts\activate

3. **Instale as dependências:**
    ```bash
    pip install -r requirements.txt

4. **Configure o banco de dados:**
- Crie um banco de dados MySQL
- Atualize o arquivo ```setings.py``` com suas credenciais do banco de dados.

5. **Execute as migrations:**
    ```bash
    python manage.py makemigrations
    python manage.py migrate

6. **Inicie o servidor de desenvolvimento:**
    ```bash
    python manage.py runserver


Nota: Este projeto é acadêmico e foi desenvolvido como parte de um trabalho da Fatec Campinas. Algumas funcionalidades ainda estão em desenvolvimento.
