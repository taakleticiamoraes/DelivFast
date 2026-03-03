public class Produto extends EntidadeBase {
    public String nome;
    public Dinheiro preco;
    
    public Produto(String pNome, Dinheiro pPreco) {
        super();
        this.nome = pNome;
        this.preco = pPreco;
    }
    
    public override String toString() {
        return 'Produto: ' + nome +
            ' - R$' + preco.valor.setScale(2);
    }
    
}