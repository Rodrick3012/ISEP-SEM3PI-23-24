package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

public class ResultDataTotalSemi {


    private final int totalDistance;
    private final LinkedHashMap<Locals, Integer> distances;
    private final String travelTime;
    private Locals firstLocals;
    public ResultDataTotalSemi(int totalDistance, LinkedHashMap<Locals, Integer> distances, String travelTime,Locals firstLocals) {

        this.totalDistance = totalDistance;
        this.distances = distances;
        this.travelTime=travelTime;
        this.firstLocals= firstLocals;
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

    public Locals getFirstLocals() {
        return firstLocals;
    }
}
