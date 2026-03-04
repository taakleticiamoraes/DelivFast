public class ItemPedido extends EntidadeBase {

    private Produto produto;
    private Integer quantidade;
    private Dinheiro subtotal;

    public Produto getProduto() { return produto; }
    public Integer getQuantidade() { return quantidade; }
    public Dinheiro getSubtotal() { return subtotal; }

    public ItemPedido(Produto pProduto, Integer pQuantidade) {
        super();

        this.produto = pProduto;
        this.quantidade = pQuantidade;
        recalcularSubtotal();
    }

    private void recalcularSubtotal() {
        Decimal valor = produto.getPreco().valor * quantidade;
        this.subtotal = new Dinheiro(valor);
    }

    public void atualizarQuantidade(Integer novaQuantidade) {
        this.quantidade = novaQuantidade;
        recalcularSubtotal();
    }
}