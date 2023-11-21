package sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain;

import java.util.ArrayList;
import java.util.Objects;

public class ShortestPath {
    private ArrayList<Locals> path;
    private ArrayList<Integer> distances;
    private Integer totalDistance;

    public ShortestPath(ArrayList<Locals> path, ArrayList<Integer> distances, Integer totalDistance) {
        this.path = path;
        this.distances = distances;
        this.totalDistance = totalDistance;
    }

    public ArrayList<Locals> getPath() {
        return path;
    }

    public void setPath(ArrayList<Locals> path) {
        this.path = path;
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


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShortestPath that = (ShortestPath) o;
        return Objects.equals(path, that.path) && Objects.equals(distances, that.distances) && Objects.equals(totalDistance, that.totalDistance);
    }

    @Override
    public int hashCode() {
        return Objects.hash(path, distances, totalDistance);
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("Local de origem: ").append(path.get(0)).append("\n");
        sb.append("Locais de passagem: ").append(path).append("\n");
        sb.append("Distância entre os locais de percurso: ").append(distances).append("\n");
        sb.append("Local de destino: ").append(path.get(path.size()-1)).append("\n");
        sb.append("Distância total do percurso: ").append(totalDistance).append("\n");
        return sb.toString();
    }
}
