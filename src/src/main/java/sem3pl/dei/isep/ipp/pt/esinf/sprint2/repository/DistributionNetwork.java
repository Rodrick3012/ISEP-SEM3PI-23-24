package sem3pl.dei.isep.ipp.pt.esinf.sprint2.repository;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation.USEI01;

public class DistributionNetwork {
    private CommonGraph<Locals, Integer> graph;

    public boolean createDistributionNetwork(){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph();
        return graph != null;
    }

    public CommonGraph<Locals, Integer> getGraph(){
        return graph;
    }

    public boolean isEmpty(){
        return graph == null;
    }


}
