public class Pedido extends EntidadeBase {
    public Cliente cliente;
    public Restaurante restaurante;
    public List<ItemPedido> itens;
    public StatusPedido status;
    public Dinheiro total;
    
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
            if (item.produto.nome.equalsIgnoreCase(pProduto.nome)) {
                item.quantidade += pQuantidade;
                calcularTotal();
                return;
            }
        }

        itens.add(new ItemPedido(pProduto, pQuantidade));
        calcularTotal();
    }

    public Dinheiro calcularTotal() {
        Decimal soma = 0;

        for (ItemPedido item : itens) {
            soma += item.calcularSubtotal();
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