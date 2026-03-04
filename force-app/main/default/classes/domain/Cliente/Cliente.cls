public class Cliente extends Pessoa {

    public Endereco endereco;
    public String telefone;

    public Cliente(
        String pNome,
        Documento pDocumento,
        Endereco pEndereco,
        String pTelefone
    ) {
        super(pNome, pDocumento);
        this.endereco = pEndereco;
        this.telefone = pTelefone;
    }

    public override String getTipoPessoa() {
        return 'Cliente';
    }

    public override String toString() {
        return 'Cliente: ' + nome +
            ', Documento: ' + documento +
            ', Endereço: ' + endereco +
            ', Telefone: ' + telefone +
            ', ID: ' + id;
    }
}