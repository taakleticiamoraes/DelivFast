public class Produto extends EntidadeBase {

    private String nome;
    private Dinheiro preco;

    public String getNome() {
        return nome;
    }

    public Dinheiro getPreco() {
        return preco;
    }
    
    public Produto(String pNome, Dinheiro pPreco) {
        super();
        this.nome = pNome;
        this.preco = pPreco;
    }
    
    public override String toString() {
        return 'Produto: ' + nome +
            ' - R$' + preco.toString();
    }
}