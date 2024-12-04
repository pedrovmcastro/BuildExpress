DELIMITER $$

CREATE TRIGGER atualizar_estoque_apos_entrega
AFTER UPDATE ON entregas_entrega
FOR EACH ROW
BEGIN
    IF NEW.status = 'entregue' AND OLD.status != 'entregue' THEN
        UPDATE ecommerce_produto produto
        JOIN ecommerce_itemcarrinho ic ON ic.produto_id = produto.id
        JOIN ecommerce_carrinho carrinho ON carrinho.id = ic.carrinho_id
        JOIN ecommerce_pedido pedido ON pedido.carrinho_id = carrinho.id
        SET produto.estoque = produto.estoque - ic.quantidade
        WHERE pedido.id = NEW.pedido_id
    END IF;
END $$

DELIMITER ;   
