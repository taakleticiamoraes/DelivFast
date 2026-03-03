public class Dinheiro {
    
    public final Decimal valor;
    
    public Dinheiro(Decimal pValor) {
        if (pValor == null || pValor < 0) {
            throw new IllegalArgumentException('Valor monetário inválido.');
        }
        
        this.valor = pValor.setScale(2);
    }
    
    public Dinheiro somar(Dinheiro pOutro){
        return new Dinheiro(this.valor + pOutro.valor);
    }
    
    public Dinheiro subtrair(Dinheiro pOutro){
        Decimal resultado = this.valor - pOutro.valor;
        
        if (resultado < 0) {
            throw new IllegalArgumentException('Resultado não pode ser negativo.');
        }
        
        return new Dinheiro(resultado);
    }
    
    public Dinheiro multiplicar(Integer pMultiplicador){
        if (pMultiplicador == null || pMultiplicador < 0) {
            throw new IllegalArgumentException('Multiplicador inválido.');
        }
        
        return new Dinheiro(this.valor * pMultiplicador);
    }
    
    public Boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Dinheiro)) {
            return false;
        }
        
        Dinheiro outro = (Dinheiro) obj;
        return this.valor == outro.valor;
    }
    
    public override Integer hashCode() {
        return valor.hashCode();
    }
    
    public override String toString() {
        return 'R$ ' + valor;
    }
}