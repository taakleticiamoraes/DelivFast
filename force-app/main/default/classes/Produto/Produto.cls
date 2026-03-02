public class Produto extends EntidadeBase {
    public String nome;
    public Decimal preco;
    
    public Produto(String pNome, Decimal pPreco) {
        super();
        this.nome = pNome;
        this.preco = pPreco;
    }
    
    public override String toString() {
        return 'Produto: ' + nome +
            ' - R$' + preco.setScale(2).format();
    }
    
}