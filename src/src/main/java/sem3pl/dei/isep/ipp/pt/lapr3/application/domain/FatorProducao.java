package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

public class FatorProducao {
    private String designacao;
    private int fabricante;
    private int formulacao;
    private int classificacao;
    private int objetivo;
    private int ph;

    public FatorProducao(String designacao, int fabricante, int formulacao, int classificacao, int objetivo, int ph) {
        this.designacao = designacao;
        this.fabricante = fabricante;
        this.formulacao = formulacao;
        this.classificacao = classificacao;
        this.objetivo = objetivo;
        this.ph = ph;
    }

    public String getDesignacao() {
        return designacao;
    }

    public int getFabricante() {
        return fabricante;
    }

    public int getFormulacao() {
        return formulacao;
    }

    public int getClassificacao() {
        return classificacao;
    }

    public int getObjetivo() {
        return objetivo;
    }

    public int getPh() {
        return ph;
    }

    @Override
    public String toString() {
        return designacao;
    }
}
