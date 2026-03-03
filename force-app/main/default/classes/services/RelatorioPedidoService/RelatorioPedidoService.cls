public class RelatorioPedidoService {
    
    public static Map<Produto, Integer> produtosMaisVendidos(List<Pedido> pPedidos) {
        Map<Produto, Integer> vendas = new Map<Produto, Integer>();
        
        for (Pedido p : pPedidos) {
            for (ItemPedido item : p.itens) {
                if (vendas.containsKey(item.produto)) {
                    vendas.put(
                        item.produto,
                    vendas.get(item.produto) + item.quantidade
                        );
                } else {
                    vendas.put(item.produto, item.quantidade);
                }
            }
        }
        return vendas;
    }
    
    public static Map<String, List<Pedido>> pedidosPorCliente(
        List<Pedido> pPedidos,
    List<String> pCpfs
    ) {
        Map<String, List<Pedido>> resultado = new Map<String, List<Pedido>>();
        
        for (String cpf : pCpfs) {
            resultado.put(cpf, new List<Pedido>());
        }
        
        for (Pedido pedido : pPedidos) {
            String cpf = pedido.cliente.cpf.valor;
            
            if (resultado.containsKey(cpf)) {
                resultado.get(cpf).add(pedido);
            }
        }
        
        return resultado;
    }
}