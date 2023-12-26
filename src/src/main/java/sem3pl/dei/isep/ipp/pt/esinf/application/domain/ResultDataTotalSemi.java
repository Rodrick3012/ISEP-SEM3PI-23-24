package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import java.util.Map;

public  class ResultDataTotalSemi {
    private final int totalDistance;
    private final Map<Locals, Integer> distances;

    public ResultDataTotalSemi(int totalDistance, Map<Locals, Integer> distances) {
        this.totalDistance = totalDistance;
        this.distances = distances;
    }

    public int getTotalDistance() {
        return totalDistance;
    }

    public Map<Locals, Integer> getDistances() {
        return distances;
    }
}
