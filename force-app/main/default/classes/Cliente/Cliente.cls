public class Cliente extends EntidadeBase {

    public String nome;
    public Documento cpf;
    public Endereco endereco;
    public String telefone;

    public Cliente(
        String pNome,
        Documento pCpf,
        Endereco pEndereco,
        String pTelefone
    ) {
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
            ', Telefone: ' + telefone +
            ', ID: ' + id;
    }
}