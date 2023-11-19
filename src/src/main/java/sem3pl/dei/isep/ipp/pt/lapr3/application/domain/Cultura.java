package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Date;

public class Cultura {
    private int id;
    private String planta;
    private Date dataInicio;
    private Date dataFim;
    private int quantidade;

    public Cultura(int id, String planta, Date dataInicio, Date dataFim, int quantidade) {
        this.id = id;
        this.planta = planta;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.quantidade = quantidade;
    }

    public int getId() {
        return id;
    }

    public String getPlanta() {
        return planta;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public String toString() {
        return planta + " " + dataInicio;
    }
}
