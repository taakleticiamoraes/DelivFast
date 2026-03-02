public class ItemPedido extends EntidadeBase{

    public Produto produto;
    public Integer quantidade;
    public Decimal subtotal;

    public ItemPedido(Produto pProduto, Integer pQuantidade) {
        super();
        this.produto = pProduto;
        this.quantidade = pQuantidade;
        this.subtotal = calcularSubtotal();
    }

    public Decimal calcularSubtotal() {
        if (produto == null) {
            System.debug('Erro: Produto inválido para calcular subtotal.');
            this.subtotal = 0.00;
            return 0.00;
        }

        if (quantidade == null || quantidade <= 0) {
            System.debug('Erro: Quantidade inválida para calcular subtotal. Deve ser maior que zero.');
            this.subtotal = 0.00;
            return 0.00;
        }

        this.subtotal = produto.preco * quantidade;
        return this.subtotal;
    }
}