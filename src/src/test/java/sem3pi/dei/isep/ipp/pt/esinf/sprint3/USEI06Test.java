package sem3pi.dei.isep.ipp.pt.esinf.sprint3;

import org.junit.Assert;
import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.InfoForUs06;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.ResultDataTotalSemi;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.map.MapGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3.USEI06;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.concurrent.locks.LockSupport;

import static org.junit.Assert.assertEquals;

public class USEI06Test {
    Graph<Locals, Integer> graph = new MapGraph<>(false);

    @Test
    public void testToFindError() {
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");

        USEI06.getAllPathsWithinAutonomyDFS(graph, graph.vertex(0), graph.vertex(0), 100, 50);
    }

    //teste para ao metodo que calcula tempo de viagem
    @Test
    public void testCalculateTravelTime() {
        int averageSpeed = 50; // Velocidade média em km/h
        int totalDistance = 100000; // Distância total em m

        String expected = "Total travel time: 2 hours, 0 minutes, 0 seconds.";
        String actual = USEI06.calculateTravelTime(averageSpeed, totalDistance);

        assertEquals(expected, actual);
    }


    //teste para metodo de retorno

    @Test
    public void testReturnMethod1() {
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        Map<LinkedList<Locals>, ResultDataTotalSemi> result = USEI06.getAllPathsWithinAutonomyDFS(graph, graph.vertex(0), graph.vertex(0), 50, 60);
        LinkedList<Locals> expectedKey1 = new LinkedList<Locals>();
        expectedKey1.add(graph.vertex(0));
        expectedKey1.add(graph.vertex(60));
        expectedKey1.add(graph.vertex(0));

        // Obter a primeira chave do mapa
        LinkedList<Locals> firstKeyResult = result.keySet().iterator().next();
        assertEquals(expectedKey1, firstKeyResult);


    }


    @Test
    public void testReturnMethod2() {
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        Map<LinkedList<Locals>, ResultDataTotalSemi> result = USEI06.getAllPathsWithinAutonomyDFS(graph, graph.vertex(0), graph.vertex(0), 50, 60);

        LinkedHashMap<Locals, Integer> expectedDistances = new LinkedHashMap<>();
        expectedDistances.put(graph.vertex(60), 16541);
        expectedDistances.put(graph.vertex(0), 16541);
        ResultDataTotalSemi expectedResult = new ResultDataTotalSemi(33082, expectedDistances, "Total travel time: 0 hours, 33 minutes, 4 seconds.", graph.vertex(0));

        // Obter a primeira chave do mapa
        LinkedList<Locals> firstKeyResult = result.keySet().iterator().next();

        // Obter o valor associado à primeira chave
        ResultDataTotalSemi valorAssociado = result.get(firstKeyResult);

        assertEquals(expectedResult.getTotalDistance(), valorAssociado.getTotalDistance());
        assertEquals(expectedResult.getDistances(), valorAssociado.getDistances());
        assertEquals(expectedResult.getTravelTime(), valorAssociado.getTravelTime());
        assertEquals(expectedResult.getFirstLocals(), valorAssociado.getFirstLocals());


    }
}

