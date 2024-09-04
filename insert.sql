-- SCRIPT PARA INSERÇÃO DE DADOS

-- Database BuildExrpress

-- Alunos:
-- Pedro Henrique Cezarini
-- Pedro Vitor Marques de Castro

\! echo 'enderecos';
-- Inserção de 7 endereços:
INSERT INTO `enderecos` (`logradouro`, `numero`, `bairro`, `cidade`, `cep`) VALUES
('Rua Barão de Jaguara', '123', 'Centro', 'Campinas', '13010-210'),
('Avenida Andrade Neves', '456', 'Vila Industrial', 'Campinas', '13036-080'),
('Rua Maria Monteiro', '789', 'Cambuí', 'Campinas', '13025-151'),
('Avenida José de Souza Campos', '101', 'Nova Campinas', 'Campinas', '13092-123'),
('Rua Jorge de Figueiredo Corrêa', '202', 'Parque Taquaral', 'Campinas', '13076-390'),
('Rua Dr. Quirino', '303', 'Centro', 'Campinas', '13015-080'),
('Avenida Orosimbo Maia', '404', 'Jardim Guanabara', 'Campinas', '13073-003');

\! echo 'usuarios';
-- Inserção de 4 usuários:
INSERT INTO `usuarios` (`nome`, `cpf`, `telefone`, `email`) VALUES
('Ana Clara Oliveira', '12345678901', '19987654321', 'ana.clara@gmail.com'),
('Bruno Henrique Silva', '23456789012', '19987654322', 'bruno.silva@hotmail.com'),
('Daniela Lima Ferreira', '45678901234', '19987654324', 'daniela.lima@outlook.com'),
('Eduardo Lima Ferreira', '56789012345', '19987654325', 'eduardo.lima@gmail.com');

\! echo 'enderecos_usuarios';
-- Associação entre usuários e endereços:
INSERT INTO `enderecos_usuarios` (`id_usuario`, `id_endereco`) VALUES
(1, 5),
(2, 6),
(3, 7),
(4, 7);
-- Note que o mesmo endereço é atribuído a dois usuários diferentes (pelos nomes provavelmente são irmãos)

\! echo 'lojas';
-- Iserção de 4 lojas: 
INSERT INTO `lojas` (`id_endereco`, `nome`, `cnpj`, `ie`, `nota`, `logo`) VALUES
(1, 'ConstruShopping', '12345678000101', '123456789', 4.5, '/images/logos/construshopping.png'),
(2, 'Casa Forte Materiais', '23456789000112', '234567890', 4.2, '/images/logos/casaforte.png'),
(3, 'Construcenter Campinas', '34567890000123', '345678901', 4.8, '/images/logos/construcenter.png'),
(4, 'Ferragem e Cia', '45678901000134', '456789012', 4.3, '/images/logos/ferragemecia.png');

\! echo 'veiculos';
-- Inserção de 5 veículos:
INSERT INTO `veiculos` (`categoria`, `placa`, `marca`, `modelo`, `imagem`) VALUES
('Carro', 'ABC1234', 'Fiat', 'Uno', '/images/veiculos/uno.png'),
('Carro', 'DEF5678', 'Volkswagen', 'Gol', '/images/veiculos/gol.png'),
('Moto', 'GHI9012', 'Honda', 'CG 160', '/images/veiculos/cg160.png'),
('Caminhão', 'JKL3456', 'Mercedes-Benz', 'Atego 1419', '/images/veiculos/atego1419.png'),
('Moto', 'MNO7890', 'Yamaha', 'Fazer 250', '/images/veiculos/fazer250.png');

\! echo 'motoristas';
-- Inserção de 4 motoristas:
INSERT INTO `motoristas` (`id_usuario`, `cnh`, `categoria`, `nota`, `qtd_viagens`, `foto`) VALUES
(1, '123456789', 'B', 4.8, 150, '/images/motoristas/motorista1.png'),
(2, '234567890', 'B', 4.6, 120, '/images/motoristas/motorista2.png'),
(3, '345678901', 'A', 4.9, 180, '/images/motoristas/motorista3.png'),
(4, '456789012', 'B', 4.7, 100, '/images/motoristas/motorista4.png');

\! echo 'veiculos_motoristas';
-- Associação entre veículos e motoristas:
INSERT INTO `veiculos_motoristas` (`id_motorista`, `id_veiculo`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(4, 5);
-- Note que o mesmo motorista está associado a dois veículos

\! echo 'produtos';
-- Inserção de produtos
INSERT INTO `produtos` (`id_loja`, `nome`, `descricao`, `preco`, `peso`, `imagem`) VALUES
(1, 'Cimento Portland', 'Cimento Portland de alta qualidade para construção civil.', 25.50, 50.0, '/images/produtos/cimento_portland.png'),
(1, 'Areia Fina', 'Areia fina peneirada, ideal para acabamentos em obras.', 15.75, 1000.0, '/images/produtos/areia_fina.png'),
(2, 'Tijolo Baiano', 'Tijolo baiano para alvenaria, resistente e de alta durabilidade.', 1.20, 2.5, '/images/produtos/tijolo_baiano.png'),
(2, 'Viga de Aço 12m', 'Viga de aço para estruturas metálicas, medindo 12 metros de comprimento.', 420.00, 80.0, '/images/produtos/viga_aco_12m.png'),
(3, 'Telha de Cerâmica', 'Telha de cerâmica esmaltada, resistente a intempéries.', 3.50, 5.0, '/images/produtos/telha_ceramica.png'),
(3, 'Porta de Madeira', 'Porta de madeira maciça para interiores, com acabamento natural.', 350.00, 30.0, '/images/produtos/porta_madeira.png'),
(4, 'Piso Cerâmico 60x60', 'Piso cerâmico de 60x60 cm, resistente e fácil de limpar.', 35.00, 20.0, '/images/produtos/piso_ceramico.png'),
(4, 'Torneira Monocomando', 'Torneira monocomando para lavatórios, com design moderno.', 120.00, 2.0, '/images/produtos/torneira_monocomando.png'),
(1, 'Bloco de Concreto', 'Bloco de concreto para alvenaria estrutural, de alta resistência.', 2.80, 9.0, '/images/produtos/bloco_concreto.png'),
(2, 'Massa Corrida 25kg', 'Massa corrida para nivelamento de superfícies, embalagem de 25 kg.', 55.00, 25.0, '/images/produtos/massa_corrida.png');

-- Agora vamos simular algumas compras:

\! echo 'carrinhos';
-- Inserção de carrinhos de produto:

-- Carrinho 1 (Loja 1)
INSERT INTO `carrinhos` (`id_usuario`, `qtd_itens`, `preco_total`, `peso_total`)
VALUES (1, 2, 132.50, 21.0);

-- Carrinho 2 (Loja 2)
INSERT INTO `carrinhos` (`id_usuario`, `qtd_itens`, `preco_total`, `peso_total`)
VALUES (2, 2, 122.00, 19.0);

-- Carrinho 3 (Loja 3)
INSERT INTO `carrinhos` (`id_usuario`, `qtd_itens`, `preco_total`, `peso_total`)
VALUES (3, 3, 150.00, 22.5);

\! echo 'itens_carrinhos';
-- Adicionando items aos carrinhos:

-- Carrinho 1 - Loja 1
INSERT INTO `itens_carrinho` (`id_carrinho`, `id_produto`)
VALUES 
    (1, 1),  -- Produto 1 (Loja 1)
    (1, 2);  -- Produto 2 (Loja 1)

-- Carrinho 2 - Loja 2
INSERT INTO `itens_carrinho` (`id_carrinho`, `id_produto`)
VALUES 
    (2, 3),  -- Produto 3 (Loja 2)
    (2, 4);  -- Produto 4 (Loja 2)

-- Carrinho 3 - Loja 3
INSERT INTO `itens_carrinho` (`id_carrinho`, `id_produto`)
VALUES 
    (3, 5),  -- Produto 5 (Loja 3)
    (3, 6),  -- Produto 6 (Loja 3)
    (3, 7);  -- Produto 7 (Loja 3)

\! echo 'pedidos';
-- Inserção dos pedidos:

-- Pedido 1 para Carrinho 1, Entrega no Endereço 5, Usuario 1
INSERT INTO `pedidos` (`id_carrinho`, `id_endereco_entrega`, `taxa_entrega`, `status_pedido`)
VALUES (1, 5, 15.00, 'aguardando');

-- Pedido 2 para Carrinho 2, Entrega no Endereço 6, Usuario 2
INSERT INTO `pedidos` (`id_carrinho`, `id_endereco_entrega`, `taxa_entrega`, `status_pedido`)
VALUES (2, 6, 20.00, 'aguardando');

-- Pedido 3 para Carrinho 3, Entrega no Endereço 7, Usuario 3
INSERT INTO `pedidos` (`id_carrinho`, `id_endereco_entrega`, `taxa_entrega`, `status_pedido`)
VALUES (3, 7, 25.00, 'aguardando');

\! echo 'pagamentos';
-- Inserção dos pagamentos dos pedidos:

INSERT INTO `pagamentos` (`id_pedido`, `metodo_pagamento`, `valor`) VALUES
(1, 'pix', 157.50),
(2, 'pix', 134.00),
(3, 'credito', 165.00);

\! echo 'comissoes_aplicativo';
-- Inserção das comissões dos pedidos (10% do preço total dos pedidos):

INSERT INTO `comissoes_aplicativo` (`id_pedido`, `valor_comissao`)
VALUES
(1, 13.25),
(2, 12.20),
(3, 15.00);

\! echo 'entregas';
-- Inserção das entregas referentes aos pedidos:

-- Entrega para o Pedido 1
INSERT INTO `entregas` (`id_pedido`, `id_motorista`, `status_entrega`, `codigo_entrega`)
VALUES (1, 1, 'a caminho', 1234);

-- Entrega para o Pedido 2
INSERT INTO `entregas` (`id_pedido`, `id_motorista`, `status_entrega`, `codigo_entrega`)
VALUES (2, 2, 'a caminho', 6543);

-- Entrega para o Pedido 3
INSERT INTO `entregas` (`id_pedido`, `id_motorista`, `status_entrega`, `codigo_entrega`)
VALUES (3, 3, 'a caminho', 7890);

\! echo 'pagamentos_motorista';
-- Inserção do pagamento aos motoristas (80% da taxa de entrega):

-- Pagamento para o Motorista da Entrega 1
INSERT INTO `pagamentos_motoristas` (`id_entrega`, `valor`)
VALUES (1, 12.00);

-- Pagamento para o Motorista da Entrega 2
INSERT INTO `pagamentos_motoristas` (`id_entrega`, `valor`)
VALUES (2, 16.00);

-- Pagamento para o Motorista da Entrega 3
INSERT INTO `pagamentos_motoristas` (`id_entrega`, `valor`)
VALUES (3, 20.00);

\! echo 'taxas_aplicativo';
-- Inserção das taxas do aplicativo (20% da taxa de entrega):

-- Taxa do Aplicativo para a Entrega 1
INSERT INTO `taxas_aplicativo` (`id_entrega`, `valor`)
VALUES (1, 3.00);

-- Taxa do Aplicativo para a Entrega 2
INSERT INTO `taxas_aplicativo` (`id_entrega`, `valor`)
VALUES (2, 4.00);

-- Taxa do Aplicativo para a Entrega 3
INSERT INTO `taxas_aplicativo` (`id_entrega`, `valor`)
VALUES (3, 5.00);

