public with sharing class Produto {
    public String nome;
    public Decimal preco;
    
    public Produto(String pNome, Decimal pPreco) {
        this.nome = pNome;
        this.preco = pPreco;
    }
    
    public override String toString() {
        return 'Produto: ' + nome +
            ', Preço: ' + preco;
    }
    
}