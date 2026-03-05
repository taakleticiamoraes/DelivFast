public class PedidoService {

    private PoliticaDeFrete politicaDeFrete;

    public PedidoService(PoliticaDeFrete pPoliticaDeFrete) {
        this.politicaDeFrete = pPoliticaDeFrete;
    }

    public void confirmarPedido(Pedido pedido) {

        validarConfirmacao(pedido);

        aplicarFrete(pedido);

        pedido.alterarStatus(StatusPedido.EM_PROCESSAMENTO);
    }
    public void cancelarPedido(Pedido pedido) {

        StatusPedido statusAtual = pedido.getStatus();

        if (statusAtual == StatusPedido.ENTREGUE) {
            System.debug('ERRO: Pedido entregue não pode ser cancelado.');
            return;
        }

        if (statusAtual == StatusPedido.CANCELADO) {
            System.debug('ERRO: Pedido já cancelado.');
            return;
        }

        pedido.alterarStatus(StatusPedido.CANCELADO);
    }

    public void marcarComoEntregue(Pedido pedido) {

        if (pedido.getStatus() != StatusPedido.EM_PROCESSAMENTO) {
            System.debug('ERRO: Apenas pedidos em processamento podem ser entregues.');
            return;
        }

        pedido.alterarStatus(StatusPedido.ENTREGUE);
    }

    private void validarConfirmacao(Pedido pedido) {

        if (pedido == null) {
            System.debug('ERRO: Pedido inválido.');
            return;
        }

        if (pedido.getStatus() != StatusPedido.CARRINHO) {
            System.debug('ERRO: Pedido não está no estado correto.');
            return;
        }

        if (pedido.estaVazio()) {
            System.debug('ERRO: Pedido não pode estar vazio.');
            return;
        }

        if (pedido.getTotal().valor <= 0) {
            System.debug('ERRO: Total do pedido inválido.');
            return;
        }

        if (pedido.getRestaurante() == null) {
            System.debug('ERRO: Pedido sem restaurante.');
            return;
        }

        if (pedido.getCliente() == null) {
            System.debug('ERRO: Pedido sem cliente.');
            return;
        }
    }

    private void aplicarFrete(Pedido pedido) {

        if (politicaDeFrete == null) {
            return;
        }

        Dinheiro frete = politicaDeFrete.calcularFrete(pedido);

        if (frete == null) {
            return;
        }

        Dinheiro novoTotal = pedido.getTotal().somar(frete);

        System.debug('Frete aplicado: ' + frete);
        System.debug('Novo total: ' + novoTotal);
    }

}