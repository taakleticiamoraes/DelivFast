public with sharing class Restaurante {
    public String nome;
    public String endereco;
    public CategoriaRestaurante categoria;
    public List<Produto> cardapio;
    
    public Restaurante(String pNome, String pEndereco, CategoriaRestaurante pCategoria) {
        this.nome = pNome;
        this.endereco = pEndereco;
        this.categoria = pCategoria;
        this.cardapio = new List<Produto>();
    }
    
    public void adicionarProduto(Produto pProduto) {
        if (pProduto == null) {
            System.debug('Erro: Produto inválido.');
            return;
        }

        if (pProduto.nome == null || pProduto.nome.trim() == '') {
            System.debug('Erro: O nome do produto não pode ser vazio.');
            return;
        }

        for (Produto produtoExistente : cardapio) {
            if (produtoExistente.nome.equalsIgnoreCase(pProduto.nome)) {
                System.debug('Erro: O produto "' + pProduto.nome + '" já existe no cardápio.');
                return;
            }
        }

        this.cardapio.add(pProduto);
        System.debug('Sucesso: Produto "' + pProduto.nome + '" adicionado ao cardápio.');
    }
    
    public override String toString() {
        return 'Restaurante: ' + nome +
            ', Categoria: ' + categoria +
            ', Endereço: ' + endereco +
            ', Total de produtos: ' + cardapio.size();
    }
    
    public void exibirCardapio() {
        System.debug('Cardápio do Restaurante: ' + nome);

        if (cardapio.isEmpty()) {
            System.debug('O cardápio está vazio.');
            return;
        }

        Integer contador = 1;
        for (Produto produto : cardapio) {
            System.debug(contador + ' - ' + produto.toString());
            contador++;
        }
    }

    public List<Produto> buscarProdutos(String pTermoBusca) {
        List<Produto> resultados = new List<Produto>();

        for (Produto produto : cardapio) {
            if (produto.nome.toLowerCase().contains(pTermoBusca.toLowerCase())) {
                resultados.add(produto);
            }
        }

        if (resultados.isEmpty()) {
            System.debug('Nenhum produto encontrado para "' + pTermoBusca + '".');
        } else {
            System.debug('Produtos encontrados com a palavra "' + pTermoBusca + '":');
            Integer contador = 1;
            for (Produto produto : resultados) {
                System.debug(contador + ' - ' + produto.nome);
                contador++;
            }
        }

        return resultados;
    }
}