package sem3pi.dei.isep.ipp.pt.esinf.sprint3;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.map.MapGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI02;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3.USEI09;

import java.util.*;

import static org.junit.Assert.assertEquals;

public class USEI09Test {

    Graph<Locals, Integer> graph = new MapGraph<>(false);
    @Test
    public void createTestsForUSEI09(){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        USEI09 usei09 = new USEI09();

        Map<Locals, Set<Locals>> result = usei09.organizeClusters(graph, 4);

        assertEquals("[CT214, CT162, CT172, CT293]", result.keySet().toString());
        assertEquals("[]", result.get(new Locals("CT162")).toString());

    }
}
