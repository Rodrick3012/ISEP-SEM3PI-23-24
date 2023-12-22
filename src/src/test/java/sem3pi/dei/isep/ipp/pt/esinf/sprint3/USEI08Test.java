package sem3pi.dei.isep.ipp.pt.esinf.sprint3;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.InfoForUs08;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.map.MapGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI02;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3.USEI08;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class USEI08Test {

    Graph<Locals, Integer> graph = new MapGraph<>(false);

    @Test
    public void checkAllHubsArePresentFor5Hubs(){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        USEI02 usei02 = new USEI02();
        InfoForUs08 infoForUs08 ;
        List<Edge<Locals,Integer>> graph1 =new ArrayList<>();
        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 5);
        for (Locals h: hubs) {
            System.out.println("HUB"+h);
        }
        USEI08 usei08 = new USEI08();

        infoForUs08 = USEI08.findOptimalCircuit(graph,hubs,graph.vertices().get(0));
        assertTrue(USEI08.areAllHubsPresent(infoForUs08.getListEdges(),hubs));
    }
    @Test
    public void checkAllHubsArePresentFor6Hubs(){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        USEI02 usei02 = new USEI02();
        InfoForUs08 infoForUs08 ;
        List<Edge<Locals,Integer>> graph1 =new ArrayList<>();
        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 6);
        for (Locals h: hubs) {
            System.out.println("HUB"+h);
        }
        USEI08 usei08 = new USEI08();

        infoForUs08 = USEI08.findOptimalCircuit(graph,hubs,graph.vertices().get(0));
        assertTrue(USEI08.areAllHubsPresent(infoForUs08.getListEdges(),hubs));
    }
    @Test
    public void checkAllHubsArePresentFor7Hubs(){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        USEI02 usei02 = new USEI02();
        InfoForUs08 infoForUs08 ;
        List<Edge<Locals,Integer>> graph1 =new ArrayList<>();
        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 7);
        for (Locals h: hubs) {
            System.out.println("HUB"+h);
        }
        USEI08 usei08 = new USEI08();

        infoForUs08 = USEI08.findOptimalCircuit(graph,hubs,graph.vertices().get(0));
        assertTrue(USEI08.areAllHubsPresent(infoForUs08.getListEdges(),hubs));
        
    }

}
