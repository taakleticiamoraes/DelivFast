public class Pedido extends EntidadeBase{
    public Cliente cliente;
    public Restaurante restaurante;
    public List<ItemPedido> itens;
    public StatusPedido status;
    public Decimal total;
    
    public Pedido(Cliente pCliente, Restaurante pRestaurante) {
        super();
        this.cliente = pCliente;
        this.restaurante = pRestaurante;
        this.status = StatusPedido.CARRINHO;
        this.itens = new List<ItemPedido>();
        this.total = 0.0;
    }
    
    public void adicionarItemPedido(Produto pProduto, Integer pQuantidade) {
        if (pQuantidade <= 0) {
            System.debug('Erro: Quantidade inválida.');
            return;
        }
        
        Boolean produtoExisteNoCardapio = false;
        
        for (Produto produtoCardapio : restaurante.cardapio) {
            if (produtoCardapio.nome.equalsIgnoreCase(pProduto.nome)) {
                produtoExisteNoCardapio = true;
                break;
            }
        }
        
        if (!produtoExisteNoCardapio) {
            System.debug(
                'Erro: O produto "' + pProduto.nome +
                '" não está disponível no cardápio do restaurante "' +
                restaurante.nome + '".'
                );
            return;
        }
        
        for (ItemPedido item : itens) {
            if (item.produto.nome.equalsIgnoreCase(pProduto.nome)) {
                item.quantidade += pQuantidade;
                System.debug(
                    'Quantidade atualizada: ' + pProduto.nome +
                    ' - Nova quantidade: ' + item.quantidade
                    );
                calcularTotal();
                return;
            }
        }
        
        ItemPedido novoItem = new ItemPedido(pProduto, pQuantidade);
        itens.add(novoItem);
        
        System.debug(
            'Item adicionado: ' + pProduto.nome +
            ' - Quantidade: ' + pQuantidade
            );
        
        calcularTotal();
    }
    
    public Decimal calcularTotal() {
        Decimal soma = 0;
        
        for (ItemPedido item : itens) {
            soma += item.calcularSubtotal();
        }
        
        total = soma;
        
        System.debug('Total atualizado do pedido: R$ ' + total.setScale(2));
        return total;
    }
    
    public void confirmarPedido() {
        if (status != StatusPedido.CARRINHO) {
            System.debug('Erro: O pedido já foi confirmado.');
            return;
        }
        
        if (itens.isEmpty()) {
            System.debug('Erro: Não é possível confirmar um pedido vazio.');
            return;
        }
        
        status = StatusPedido.EM_PROCESSAMENTO;
        System.debug('Pedido confirmado com sucesso!');
    }
    
    public void exibirResumo() {
        System.debug('RESUMO DO PEDIDO');
        System.debug('Cliente: ' + cliente.nome);
        System.debug('Restaurante: ' + restaurante.nome);
        
        System.debug('Itens do pedido:');
        Integer i = 1;
        
        for (ItemPedido item : itens) {
            System.debug(
                i + ' - ' +
                item.produto.nome +
                ' - Quantidade: ' + item.quantidade +
                ' - Subtotal: R$ ' + item.calcularSubtotal().setScale(2)
                );
            i++;
        }
        
        System.debug('Total: R$ ' + total.setScale(2));
        System.debug('Status do pedido: ' + status);
    }
    
    public static Map<Produto, Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos) {
        Map<Produto, Integer> vendasPorProduto = new Map<Produto, Integer>();
        
        for (Pedido pedido : pedidos) {
            for (ItemPedido item : pedido.itens) {
                if (vendasPorProduto.containsKey(item.produto)) {
                    vendasPorProduto.put(
                        item.produto,
                    vendasPorProduto.get(item.produto) + item.quantidade
                        );
                } else {
                    vendasPorProduto.put(item.produto, item.quantidade);
                }
            }
        }
        
        List<Produto> produtosOrdenados = new List<Produto>(vendasPorProduto.keySet());
        
        produtosOrdenados.sort(new ComparadorProdutosMaisVendidos(vendasPorProduto));
        
        System.debug('Top 3 produtos mais vendidos:');
        
        Integer limite = Math.min(3, produtosOrdenados.size());
        
        for (Integer i = 0; i < limite; i++) {
            Produto p = produtosOrdenados[i];
            System.debug(
                (i + 1) + '. ' +
                p.nome + ' – ' +
                vendasPorProduto.get(p) + ' unidades'
                );
        }
        
        return vendasPorProduto;
    }
    
    public class ComparadorProdutosMaisVendidos implements Comparator<Produto> {
        private Map<Produto, Integer> mapa;
        
        public ComparadorProdutosMaisVendidos(Map<Produto, Integer> mapa) {
            this.mapa = mapa;
        }
        
        public Integer compare(Produto a, Produto b) {
            Integer qtdA = mapa.get(a);
            Integer qtdB = mapa.get(b);
            
            if (qtdA != qtdB) {
                return qtdB - qtdA;
            }
            
            return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
        }
    }
    
    public static Map<String, List<Pedido>> gerarRelatorioPedidosPorCliente(
        List<Pedido> pedidos,
    List<String> cpfs
    ) {
        Map<String, List<Pedido>> pedidosPorCliente = new Map<String, List<Pedido>>();
        
        for (String cpf : cpfs) {
            pedidosPorCliente.put(cpf, new List<Pedido>());
        }
        
        for (Pedido pedido : pedidos) {
            String cpfCliente = pedido.cliente.cpf;
            
            if (pedidosPorCliente.containsKey(cpfCliente)) {
                pedidosPorCliente.get(cpfCliente).add(pedido);
            }
        }
        System.debug('Relatório de pedidos por cliente:');
        
        for (String cpf : pedidosPorCliente.keySet()) {
            Integer totalPedidos = pedidosPorCliente.get(cpf).size();
            
            System.debug(
                'Cliente: ' + cpf +
                ' – ' + totalPedidos + ' pedidos'
                );
        }
        
        return pedidosPorCliente;
    }
}