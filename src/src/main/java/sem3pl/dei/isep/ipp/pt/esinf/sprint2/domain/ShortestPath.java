package sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain;

import java.util.ArrayList;
import java.util.Objects;

public class ShortestPath {
    private ArrayList<Locals> path;
    private ArrayList<Locals> refuelingPoints;
    private ArrayList<Integer> distances;
    private Integer totalDistance;
    private Integer totalRefuelings;

    public ShortestPath(ArrayList<Locals> path, ArrayList<Locals> refuelingPoints, ArrayList<Integer> distances, Integer totalDistance, Integer totalRefuelings) {
        this.path = path;
        this.refuelingPoints = refuelingPoints;
        this.distances = distances;
        this.totalDistance = totalDistance;
        this.totalRefuelings = totalRefuelings;
    }

    public ArrayList<Locals> getPath() {
        return path;
    }

    public void setPath(ArrayList<Locals> path) {
        this.path = path;
    }

    public ArrayList<Locals> getRefuelingPoints() {
        return refuelingPoints;
    }

    public void setRefuelingPoints(ArrayList<Locals> refuelingPoints) {
        this.refuelingPoints = refuelingPoints;
    }

    public ArrayList<Integer> getDistances() {
        return distances;
    }

    public void setDistances(ArrayList<Integer> distances) {
        this.distances = distances;
    }

    public Integer getTotalDistance() {
        return totalDistance;
    }

    public void setTotalDistance(Integer totalDistance) {
        this.totalDistance = totalDistance;
    }

    public Integer getTotalRefuelings() {
        return totalRefuelings;
    }

    public void setTotalRefuelings(Integer totalRefuelings) {
        this.totalRefuelings = totalRefuelings;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShortestPath that = (ShortestPath) o;
        return Objects.equals(path, that.path) && Objects.equals(refuelingPoints, that.refuelingPoints) && Objects.equals(distances, that.distances) && Objects.equals(totalDistance, that.totalDistance) && Objects.equals(totalRefuelings, that.totalRefuelings);
    }

    @Override
    public int hashCode() {
        return Objects.hash(path, refuelingPoints, distances, totalDistance, totalRefuelings);
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("Local de origem: ").append(path.get(0)).append("\n");
        sb.append("Locais de passagem: ").append(path).append("\n");
        sb.append("Distância entre os locais de percurso: ").append(distances).append("\n");
        sb.append("Local de destino: ").append(path.get(path.size()-1)).append("\n");
        sb.append("Distância total do percurso: ").append(totalDistance).append("\n");
        sb.append("Locais onde foi feito carragamento: ").append(refuelingPoints).append("\n");
        sb.append("Número total de carregamentos: ").append(totalRefuelings);
        return sb.toString();
    }
}
