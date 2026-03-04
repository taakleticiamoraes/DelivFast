public class ItemPedido extends EntidadeBase {
    
    private Produto produto;
    private Integer quantidade;
    private Decimal subtotal;

    public Produto getProduto() { return produto; }
    public Integer getQuantidade() { return quantidade; }
    public Decimal getSubtotal() { return subtotal; }

    public ItemPedido(Produto pProduto, Integer pQuantidade) {
        super();

        this.produto = pProduto;
        this.quantidade = pQuantidade;
        this.subtotal = pProduto.getPreco().multiplicar(pQuantidade).valor;
    }
}