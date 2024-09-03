-- Tables

CREATE TABLE `enderecos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `logradouro` VARCHAR(50) NOT NULL,
    `numero` VARCHAR(8),
    `bairro` VARCHAR(50) NOT NULL,
    `cidade` VARCHAR(50) NOT NULL,
    `cep` VARCHAR(10) NOT NULL
);

CREATE TABLE `enderecos_usuarios` (
    `id_usuario` INT,
    `id_endereco` INT,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`),
    FOREIGN KEY (`id_endereco`) REFERENCES `enderecos`(`id`),
    PRIMARY KEY(`id_usuario`, `id_endereco`)
);

CREATE TABLE `usuarios` (
    `id` INT AUTO_INCREMENT PRIMARY KEY, 
    `nome` VARCHAR(100) NOT NULL,
    `cpf` VARCHAR(11) NOT NULL UNIQUE,
    `telefone` VARCHAR(12) NOT NULL,
    `email` VARCHAR(30) NOT NULL
);

CREATE TABLE `veiculos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY, 
    `categoria` VARCHAR(20) NOT NULL, 
    `placa` VARCHAR(7) NOT NULL,
    `marca` VARCHAR(20) NOT NULL,
    `modelo` VARCHAR(20) NOT NULL,
    `imagem` VARCHAR(255) NOT NULL,
);

CREATE TABLE `veiculos_motoristas` (
    `id_motorista` INT,
    `id_veiculo` INT,
    FOREIGN KEY (`id_motorista`) REFERENCES `motoristas`(`id_usuario`),
    FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos`(`id`),
    PRIMARY KEY(`id_veiculo`, `id_motorista`)
);

CREATE TABLE `motoristas` (
    `id_usuario` INT PRIMARY KEY,
    `cnh` VARCHAR(9) NOT NULL,
    `categoria` VARCHAR(1) NOT NULL CHECK (`categoria` IN ('A', 'B', 'C', 'D', 'E')),
    `nota` FLOAT NOT NULL CHECK (`nota` >= 0 AND `nota` <= 5),
    `qtd_viagens` INT NOT NULL,
    `foto` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`)
);

CREATE TABLE `lojas` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_endereco` INT NOT NULL,
    `nome` VARCHAR(100) NOT NULL,
    `cnpj` VARCHAR(14) NOT NULL UNIQUE,
    `ie` VARCHAR(9) NOT NULL UNIQUE,
    `nota` FLOAT NOT NULL CHECK (`nota` >= 0 AND `nota` <= 5),
    `logo` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`id_endereco`) REFERENCES `enderecos`(`id`)
);

CREATE TABLE `produtos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_loja` INT NOT NULL,
    `nome` VARCHAR(100) NOT NULL,
    `descricao` VARCHAR(400) NOT NULL,
    `preco` FLOAT NOT NULL,
    `peso` FLOAT NOT NULL,
    `imagem` VARCHAR(255) NOT NULL,
    FOREIGN KEY(`id_loja`) REFERENCES `lojas`(`id`) 
);

CREATE TABLE `itens_carrinho` (
    `id_carrinho` INT, 
    `id_produto` INT,
    FOREIGN KEY (`id_carrinho`) REFERENCES `carrinhos`(`id`),
    FOREIGN KEY (`id_produto`) REFERENCES `produtos`(`id`),
    PRIMARY KEY(`id_carrinho`, `id_produto`) 
);

CREATE TABLE `carrinho` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL,
    `qtd_itens` INT NOT NULL,
    `preco_total` INT NOT NULL,
    `peso_total` FLOAT NOT NULL,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`),
);

CREATE TABLE `pedidos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_carrinho` INT NOT NULL,
    `id_endereco_entrega` INT NOT NULL,
    `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `taxa_entrega` FLOAT NOT NULL,
    `status_pedido` VARCHAR(20) NOT NULL CHECK (`status` IN ('aguardando', 'preparando o pedido', 'saiu para entrega')),
    FOREIGN KEY (`id_carrinho`) REFERENCES `carrinhos`(`id`),
    FOREIGN KEY (`id_endereco_entrega`) REFERENCES `enderecos`(`id`);
);

CREATE TABLE `pagamentos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_pedido` INT NOT NULL,
    `metodo_pagamento` VARCHAR(20) NOT NULL,
    `valor` FLOAT NOT NULL,
    `data_pagamento` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_pedido`) REFERENCES `pedidos`(`id`),
);

CREATE TABLE `entregas` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_pedido` INT NOT NULL,
    `id_motorista` INT NOT NULL,
    `status_entrega` VARCHAR(20) NOT NULL CHECK (`status` IN ('a caminho', 'cancelada', 'entregue')),
    `codigo_entrega` INT NOT NULL,
    FOREIGN KEY (`id_motorista`) REFERENCES `motoristas`(`id_usuario`),
    FOREIGN KEY (`id_pedido`) REFERENCES `pedidos`(`id`),
);

CREATE TABLE `pagamentos_motoristas` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_entrega` INT NOT NULL,
    `valor` FLOAT NOT NULL,
    `data_pagamento` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_entrega`) REFERENCES `entregas`(`id`)
);

CREATE TABLE `taxas_aplicativo` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_entrega` INT NOT NULL,
    `valor` FLOAT NOT NULL,
    `data_cobranca` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_entrega`) REFERENCES `entregas`(`id`)
);

CREATE TABLE `avaliacoes_lojas` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL,
    `id_loja` INT NOT NULL,
    `nota` FLOAT NOT NULL CHECK (`nota` >= 0 AND `nota` <= 5),
    `comentario` VARCHAR(300),
    FOREIGN KEY(`id_loja`) REFERENCES `lojas`(`id`),
    FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id`)
);

CREATE TABLE `respostas_avaliacao_loja` (
    `id_avaliacao` INT PRIMARY KEY,
    `resposta` VARCHAR(300),
    FOREIGN KEY(`id_avaliacao`) REFERENCES `avaliacoes_loja`(`id`),
);

CREATE TABLE `avaliacoes_motorista` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_motorista` INT NOT NULL,
    `nota` FLOAT NOT NULL CHECK (`nota` >= 0 AND `nota` <= 5),
    FOREIGN KEY (`id_motorista`) REFERENCES `motoristas`(`id_usuario`),
);

CREATE TABLE `notificacoes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL,
    `mensagem` VARCHAR(255) NOT NULL,
    `data_envio` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `lida` BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`)
);

CREATE TABLE `cupons` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `codigo` VARCHAR(20) NOT NULL UNIQUE,
    `desconto` FLOAT NOT NULL,
    `data_validade` DATE NOT NULL
);

CREATE TABLE `cupons_usuarios` (
    `id_cupom` INT NOT NULL,
    `id_usuario` INT NOT NULL,
    `data_resgate` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_cupom`) REFERENCES `cupons`(`id`),
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`),
    PRIMARY KEY (`id_cupom`, `id_usuario`)
);

CREATE TABLE `logs_atividades` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL,
    `atividade` VARCHAR(255) NOT NULL,
    `data_atividade` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`)
);
