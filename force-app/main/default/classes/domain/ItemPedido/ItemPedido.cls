public class ItemPedido extends EntidadeBase {
    
    private Produto produto;
    private Integer quantidade;
    private Decimal subtotal;
    
    public Produto getProduto() {
        return produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public Decimal getSubtotal() {
        return subtotal;
    }

    public ItemPedido(Produto pProduto, Integer pQuantidade) {
        super();
        this.produto = pProduto;
        this.quantidade = pQuantidade;
        this.subtotal = calcularSubtotal();
    }
    
    public Decimal calcularSubtotal() {
        if (produto == null) {
            System.debug('Erro: Produto inválido para calcular subtotal.');
            subtotal = 0.00;
            return subtotal;
        }
        
        if (quantidade == null || quantidade <= 0) {
            System.debug('Erro: Quantidade inválida.');
            subtotal = 0.00;
            return subtotal;
        }
        
        subtotal = produto.getPreco().valor * quantidade;
        return subtotal;
    }
}