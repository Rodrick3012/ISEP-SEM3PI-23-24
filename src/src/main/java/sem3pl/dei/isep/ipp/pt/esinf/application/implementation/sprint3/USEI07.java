package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;


import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI02;

import java.util.*;

public class USEI07 {
    public static void main(String[] args) {
        USEI01 usei01 = new USEI01();
        Graph<Locals, Integer> graph = usei01.readToGraph("src/src/test/resources/locais_big.csv", "src/src/test/resources/distancias_big.csv");
        ArrayList<List<LocationCriteria>> result = USEI02.optimizeLocations(graph, 10);


    }


}




