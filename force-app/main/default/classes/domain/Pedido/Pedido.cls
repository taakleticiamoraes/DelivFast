public class Pedido extends EntidadeBase {

    private Cliente cliente;
    private Restaurante restaurante;
    private List<ItemPedido> itens;
    private StatusPedido status;
    private Dinheiro total;

    public Cliente getCliente() { return cliente; }
    public Restaurante getRestaurante() { return restaurante; }
    public StatusPedido getStatus() { return status; }
    public Dinheiro getTotal() { return total; }

    public List<ItemPedido> getItens() {
        return itens.clone();
    }

    public Pedido(Cliente pCliente, Restaurante pRestaurante) {
        super();

        this.cliente = pCliente;
        this.restaurante = pRestaurante;
        this.status = StatusPedido.CARRINHO;
        this.itens = new List<ItemPedido>();
        this.total = new Dinheiro(0);
    }

    public void adicionarProduto(Produto pProduto, Integer pQuantidade) {

        if (status != StatusPedido.CARRINHO) {
            System.debug('ERRO: Pedido não pode ser alterado.');
            return;
        }

        if (pQuantidade == null || pQuantidade <= 0) {
            System.debug('ERRO: Quantidade inválida.');
            return;
        }

        for (ItemPedido item : itens) {
            if (item.getProduto().equals(pProduto)) {
                Integer novaQuantidade = item.getQuantidade() + pQuantidade;
                item.atualizarQuantidade(novaQuantidade);
                recalcularTotal();
                return;
            }
        }

        ItemPedido novoItem = new ItemPedido(pProduto, pQuantidade);
        itens.add(novoItem);

        recalcularTotal();
    }

    public void removerProduto(Produto pProduto) {

        if (status != StatusPedido.CARRINHO) {
            System.debug('ERRO: Pedido não pode ser alterado.');
            return;
        }

        for (Integer i = 0; i < itens.size(); i++) {
            if (itens[i].getProduto().equals(pProduto)) {
                itens.remove(i);
                recalcularTotal();
                return;
            }
        }

        System.debug('Produto não encontrado no pedido.');
    }
    public void alterarQuantidade(Produto pProduto, Integer pNovaQuantidade) {

        if (status != StatusPedido.CARRINHO) {
            System.debug('ERRO: Pedido não pode ser alterado.');
            return;
        }

        for (Integer i = 0; i < itens.size(); i++) {
            ItemPedido item = itens[i];

            if (item.getProduto().equals(pProduto)) {

                if (pNovaQuantidade <= 0) {
                    itens.remove(i);
                } else {
                    item.atualizarQuantidade(pNovaQuantidade);
                }

                recalcularTotal();
                return;
            }
        }

        System.debug('Produto não encontrado no pedido.');
    }

    private void recalcularTotal() {

        Decimal soma = 0;

        for (ItemPedido item : itens) {
            soma += item.getSubtotal().valor;
        }

        total = new Dinheiro(soma);
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