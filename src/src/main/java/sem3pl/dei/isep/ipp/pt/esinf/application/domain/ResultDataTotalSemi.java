package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import java.util.LinkedList;
import java.util.Map;

public class ResultDataTotalSemi {


    private final int totalDistance;
    private final Map<Locals, Integer> distances;
    private final String travelTime;

    public ResultDataTotalSemi(int totalDistance, Map<Locals, Integer> distances, String travelTime) {

        this.totalDistance = totalDistance;
        this.distances = distances;
        this.travelTime=travelTime;
    }

    public int getTotalDistance() {
        return totalDistance;
    }

    public Map<Locals, Integer> getDistances() {
        return distances;
    }

    public String getTravelTime() {
        return travelTime;
    }


}
