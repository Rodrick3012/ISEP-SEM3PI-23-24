package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

public class Unidade {
    private int id;
    private String unidade;

    public Unidade(int id, String unidade) {
        this.id = id;
        this.unidade = unidade;
    }

    public int getId() {
        return id;
    }

    public String getUnidade() {
        return unidade;
    }

    @Override
    public String toString() {
        return unidade;
    }
}
