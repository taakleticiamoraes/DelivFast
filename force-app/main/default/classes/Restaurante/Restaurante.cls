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
    
    public void adicionarProduto(Produto pProduto){
        if(pProduto.nome == null || pProduto.nome.trim() == '') {
            throw new IllegalArgumentException('O nome do produto não pode ser vazio.');
        }
        for(Produto produtoExistente : cardapio) {
            if(produtoExistente.nome.equalsIgnoreCase(pProduto.nome)) {
                throw new IllegalArgumentException('O produto já existe no cardápio.');
            }
        }
        this.cardapio.add(pProduto);
        System.debug('Sucesso: Produto adicionado com sucesso!');
    }
    
    public override String toString() {
        return 'Restaurante: ' + nome +
            ', Categoria: ' + categoria +
            ', Endereço: ' + endereco +
            ', Total de produtos: ' + cardapio.size();
    }
    
    public void exibirCardapio() {
        System.debug('Cardápio do Restaurante: ' + nome);
        if(cardapio.isEmpty()) {
            System.debug('O cardápio está vazio.');
            return;
        }else{
            for(Produto produto : cardapio) {
                System.debug(produto.toString());
            }
        }
    }
}