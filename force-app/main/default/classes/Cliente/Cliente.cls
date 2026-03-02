public class Cliente extends EntidadeBase{
    public String nome;
    public String cpf;
    public String endereco;
    public String telefone;
    
    public Cliente(String pNome, String pCpf, String pEndereco, String pTelefone) {
        super();
        this.nome = pNome;
        this.cpf = pCpf;
        this.endereco = pEndereco;
        this.telefone = pTelefone;
    }
    
    public override String toString() {
        return 'Cliente: ' + nome +
            ', CPF: ' + cpf +
            ', Endereço: ' + endereco +
            ', Telefone: ' + telefone;
    }
}