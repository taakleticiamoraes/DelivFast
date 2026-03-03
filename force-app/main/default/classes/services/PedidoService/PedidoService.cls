public class PedidoService {
    
    public static void adicionarItemPedido(
        Pedido pPedido,
        Produto pProduto,
        Integer pQuantidade
    ) {
        Boolean produtoExiste = false;
        
        for (Produto p : pPedido.restaurante.cardapio) {
            if (p.nome.equalsIgnoreCase(pProduto.nome)) {
                produtoExiste = true;
                break;
            }
        }
        
        if (!produtoExiste) {
            System.debug('ERRO: Produto não está no cardápio.');
            return;
        }
        
        pPedido.adicionarItem(pProduto, pQuantidade);
    }
}