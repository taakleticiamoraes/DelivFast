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
    
    public Boolean estaVazio() {
        return itens.isEmpty();
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
    
    private void recalcularTotal() {
        
        Dinheiro soma = new Dinheiro(0);
        
        for (ItemPedido item : itens) {
            soma = soma.somar(item.getSubtotal());
        }
        
        total = soma;
    }
    
    public void alterarStatus(StatusPedido novoStatus) {
        this.status = novoStatus;
    }
}