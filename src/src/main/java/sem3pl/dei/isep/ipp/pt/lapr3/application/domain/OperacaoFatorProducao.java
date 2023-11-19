package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Date;

public class OperacaoFatorProducao {
    private int id;
    private Date data;
    private int quantidade;
    private String parcela;
    private int modo;
    private String fatorproducao;
    private int cultura;
    private int tipooperacao;

    public OperacaoFatorProducao(int id, Date data, int quantidade, String parcela, int modo, String fatorproducao, int cultura, int tipooperacao) {
        this.id = id;
        this.data = data;
        this.quantidade = quantidade;
        this.parcela = parcela;
        this.modo = modo;
        this.fatorproducao = fatorproducao;
        this.cultura = cultura;
        this.tipooperacao = tipooperacao;
    }

    public int getId() {
        return id;
    }

    public Date getData() {
        return data;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public String getParcela() {
        return parcela;
    }

    public int getModo() {
        return modo;
    }

    public String getFatorproducao() {
        return fatorproducao;
    }

    public int getCultura() {
        return cultura;
    }

    public int getTipooperacao() {
        return tipooperacao;
    }
}
