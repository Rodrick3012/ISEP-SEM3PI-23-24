package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

public class Parcela {
    private String designacao;
    private int area;


    public Parcela(String designacao, int area) {
        this.designacao = designacao;
        this.area = area;
    }

    public String getDesignacao() {
        return designacao;
    }

    public int getArea() {
        return area;
    }

    @Override
    public String toString() {
        return designacao;
    }
}
