public class ProdutoMaisVendidoComparator implements Comparator<Produto> {

    private Map<Produto, Integer> vendas;

    public ProdutoMaisVendidoComparator(Map<Produto, Integer> pVendas) {
        this.vendas = pVendas;
    }

    public Integer compare(Produto pA, Produto pB) {
        Integer qtdA = vendas.get(pA);
        Integer qtdB = vendas.get(pB);

        if (qtdA != qtdB) {
            return qtdB - qtdA;
        }

        return pA.nome.toLowerCase().compareTo(pB.nome.toLowerCase());
    }
}