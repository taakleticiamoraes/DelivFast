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
        this.cardapio.add(pProduto);
    }
    
    public override String toString() {
        return 'Restaurante: ' + nome +
            ', Categoria: ' + categoria +
            ', Endereço: ' + endereco +
            ', Total de produtos: ' + cardapio.size();
    }
}