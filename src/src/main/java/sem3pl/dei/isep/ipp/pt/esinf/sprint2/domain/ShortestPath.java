package sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain;

import java.util.ArrayList;
import java.util.Map;
import java.util.Objects;

public class ShortestPath {
    private ArrayList<Locals> path;
    private ArrayList<Integer> distances;
    private Integer totalDistance;
    private Integer refuelingPoints;
    private Map<String, Integer> distancesForUI;

    public ShortestPath(ArrayList<Locals> path, ArrayList<Integer> distances, Integer totalDistance, Integer refuelingPoints) {
        this.path = path;
        this.distances = distances;
        this.totalDistance = totalDistance;
        this.refuelingPoints = refuelingPoints;
    }

    public ShortestPath(ArrayList<Locals> path, ArrayList<Integer> distances, Integer totalDistance, Integer refuelingPoints, Map<String, Integer> distancesForUI){
        this.path = path;
        this.distances = distances;
        this.totalDistance = totalDistance;
        this.refuelingPoints = refuelingPoints;
        this.distancesForUI = distancesForUI;
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
        try {
            Locals origin = path.get(0);
            sb.append("\n");
            sb.append("Origin: ").append(origin).append("\n");
            sb.append("Passing Places: ").append(path).append("\n");
            sb.append("Distances between route locations: ").append("\n");
            for (Map.Entry<String, Integer> entry : distancesForUI.entrySet()){
                sb.append(entry.getKey()).append(": ").append(entry.getValue()/1000).append(" km").append("\n");
            }
            sb.append("Destiny: ").append(path.get(path.size() - 1)).append("\n");
            sb.append("Total distance: ").append(totalDistance).append(" km").append("\n");
            sb.append("Number of charges made: ").append(refuelingPoints).append("\n");
        } catch (IndexOutOfBoundsException e){
            sb.append("\n");
            sb.append("Distance to low to calculate minimum distance!");
            sb.append("\n");
        }
        return sb.toString();
    }

    public Integer getRefuelingPoints() {
        return refuelingPoints;
    }

    public void setRefuelingPoints(Integer refuelingPoints) {
        this.refuelingPoints = refuelingPoints;
    }
}
