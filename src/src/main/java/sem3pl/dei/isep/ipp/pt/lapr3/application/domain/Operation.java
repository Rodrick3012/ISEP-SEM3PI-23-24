package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Date;

public class Operation {
    private int id;
    private int tipooperacao;
    private Date data;
    private int quantidade;
    private int cultura;
    private String parcela;

    public Operation(int id, int tipooperacao, Date data, int quantidade, int cultura, String parcela) {
        this.id = id;
        this.tipooperacao = tipooperacao;
        this.data = data;
        this.quantidade = quantidade;
        this.cultura = cultura;
        this.parcela = parcela;
    }

    public int getId() {
        return id;
    }

    public int getTipooperacao() {
        return tipooperacao;
    }

    public Date getData() {
        return data;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public int getCultura() {
        return cultura;
    }

    public String getParcela() {
        return parcela;
    }
}
