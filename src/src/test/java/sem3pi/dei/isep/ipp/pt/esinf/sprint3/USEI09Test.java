package sem3pi.dei.isep.ipp.pt.esinf.sprint3;

import org.apache.velocity.tools.view.VelocityLayoutServlet;
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
        graph = usei01.readToGraph("src/main/resources/locais_small.csv", "src/main/resources/distancias_small.csv");
        USEI09 usei09 = new USEI09();

        // Teste para 2 clusters

        Map<Locals, Set<Locals>> result = usei09.organizeClusters(graph, 2);
        assertEquals("[CT5, CT8]", result.keySet().toString());
        assertEquals("[CT3, CT2, CT5, CT4, CT7, CT6, CT9, CT17, CT16, CT15, CT14, CT13, CT12, CT11, CT10, CT1]", result.get(new Locals("CT5")).toString());
        assertEquals("[CT8]", result.get(new Locals("CT8")).toString());

        // Teste para 3 clusters

        Map<Locals, Set<Locals>> result1 = usei09.organizeClusters(graph, 3);
        assertEquals("[CT5, CT7, CT8]", result1.keySet().toString());
        assertEquals("[CT3, CT2, CT5, CT4, CT6, CT9, CT17, CT16, CT15, CT14, CT13, CT12, CT11, CT10, CT1]", result1.get(new Locals("CT5")).toString());
        assertEquals("[CT7]", result1.get(new Locals("CT7")).toString());
        assertEquals("[CT8]", result1.get(new Locals("CT8")).toString());

        // Teste para 4 clusters

        Map<Locals, Set<Locals>> result2 = usei09.organizeClusters(graph, 4);
        assertEquals("[CT5, CT7, CT8, CT14]", result2.keySet().toString());
        assertEquals("[CT3, CT2, CT5, CT4, CT6, CT9, CT17, CT16, CT15, CT13, CT12, CT11, CT10, CT1]", result2.get(new Locals("CT5")).toString());
        assertEquals("[CT7]", result2.get(new Locals("CT7")).toString());
        assertEquals("[CT8]", result2.get(new Locals("CT8")).toString());
        assertEquals("[CT14]", result2.get(new Locals("CT14")).toString());
    }
}
