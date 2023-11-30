package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

public class LocationCriteria {
    private Locals location; // Representa a localidade (vértice) associada aos critérios.
    private int influence;    // Representa a influência associada à localidade.
    private int centrality;   // Representa a centralidade associada à localidade.

    // Construtor
    public LocationCriteria(Locals location, int influence, int centrality) {
        this.location = location;
        this.influence = influence;
        this.centrality = centrality;
    }

    // Getters
    public Locals getLocation() {
        return location;
    }

    public int getInfluence() {
        return influence;
    }

    public int getCentrality() {
        return centrality;
    }
}

