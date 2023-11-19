package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

public class TipoOperacao {
    private int id;
    private String tipooperacao;

    public TipoOperacao(int id, String tipooperacao) {
        this.id = id;
        this.tipooperacao = tipooperacao;
    }

    public int getId() {
        return id;
    }

    public String getTipooperacao() {
        return tipooperacao;
    }

    @Override
    public String toString() {
        return tipooperacao;
    }
}
