public class Pedido extends EntidadeBase {

    private Cliente cliente;
    private Restaurante restaurante;
    private List<ItemPedido> itens;
    private StatusPedido status;
    private Dinheiro total;

    public Cliente getCliente() { return cliente; }
    public Restaurante getRestaurante() { return restaurante; }
    public List<ItemPedido> getItens() { return itens; }
    public StatusPedido getStatus() { return status; }
    public Dinheiro getTotal() { return total; }

    public Pedido(Cliente pCliente, Restaurante pRestaurante) {
        super();
        this.cliente = pCliente;
        this.restaurante = pRestaurante;
        this.status = StatusPedido.CARRINHO;
        this.itens = new List<ItemPedido>();
        this.total = new Dinheiro(0);
    }
    
    public void adicionarItem(Produto pProduto, Integer pQuantidade) {
        if (pQuantidade == null || pQuantidade <= 0) {
            System.debug('ERRO: Quantidade inválida.');
            return;
        }

        for (ItemPedido item : itens) {
            if (item.getProduto().getNome().equalsIgnoreCase(pProduto.getNome())) {
                System.debug('Produto já existe no pedido.');
                return;
            }
        }

        itens.add(new ItemPedido(pProduto, pQuantidade));
        calcularTotal();
    }

    public Dinheiro calcularTotal() {
        Decimal soma = 0;

        for (ItemPedido item : itens) {
            soma += item.getSubtotal();
        }

        total = new Dinheiro(soma);
        return total;
    }

    public void confirmarPedido() {
        if (status != StatusPedido.CARRINHO) {
            System.debug('ERRO: Pedido já confirmado.');
            return;
        }

        if (itens.isEmpty()) {
            System.debug('ERRO: Pedido vazio.');
            return;
        }

        status = StatusPedido.EM_PROCESSAMENTO;
    }
}