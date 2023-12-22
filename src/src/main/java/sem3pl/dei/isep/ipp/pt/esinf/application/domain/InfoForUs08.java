package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;

import java.util.ArrayList;
import java.util.List;

public class InfoForUs08 {


private List<Edge<Locals,Integer>> listEdges;
private int totalDistance;

    public InfoForUs08(List<Edge<Locals,Integer>> listEdges,int totalDistance){
           this.listEdges = listEdges;
           this.totalDistance = totalDistance;
    }

    public List<Edge<Locals, Integer>> getListEdges() {
        return listEdges;
    }

    public int getTotalDistance() {
        return totalDistance;
    }
}
