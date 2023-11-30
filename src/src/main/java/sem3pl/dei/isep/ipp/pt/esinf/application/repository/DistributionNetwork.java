package sem3pl.dei.isep.ipp.pt.esinf.application.repository;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;

public class DistributionNetwork {
    private CommonGraph<Locals, Integer> graph;

    public DistributionNetwork(){
    }

    public boolean createDistributionNetwork(){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/src/main/resources/locais_big.csv", "src/src/main/resources/distancias_big.csv");
        return graph != null;
    }

    public CommonGraph<Locals, Integer> getGraph(){
        return graph;
    }

    public boolean isEmpty(){
        return graph == null;
    }


}
