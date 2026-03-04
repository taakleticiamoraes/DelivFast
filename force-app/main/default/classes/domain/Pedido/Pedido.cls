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
    
    public void adicionarItem(Produto pProduto, Integer pQuantidade) {
        
        if (status != StatusPedido.CARRINHO) {
            System.debug('ERRO: Não é possível alterar o pedido após confirmação.');
            return;
        }
        
        if (pProduto == null) {
            System.debug('ERRO: Produto inválido.');
            return;
        }
        
        if (pQuantidade == null || pQuantidade <= 0) {
            System.debug('ERRO: Quantidade inválida.');
            return;
        }
        
        for (ItemPedido item : itens) {
            if (item.getProduto().id == pProduto.id) {
                System.debug('ERRO: Produto já existe no pedido.');
                return;
            }
        }
        
        ItemPedido novoItem = new ItemPedido(pProduto, pQuantidade);
        itens.add(novoItem);
        
        recalcularTotal();
    }
    
    private void recalcularTotal() {
        Decimal soma = 0;
        
        for (ItemPedido item : itens) {
            soma += item.getSubtotal();
        }
        
        total = new Dinheiro(soma);
    }
    
    public void confirmarPedido() {
        
        if (status != StatusPedido.CARRINHO) {
            System.debug('ERRO: Pedido já confirmado.');
            return;
        }
        
        if (itens.isEmpty()) {
            System.debug('ERRO: Pedido não pode ser confirmado vazio.');
            return;
        }
        
        status = StatusPedido.EM_PROCESSAMENTO;
        System.debug('Pedido confirmado com sucesso.');
    }
}