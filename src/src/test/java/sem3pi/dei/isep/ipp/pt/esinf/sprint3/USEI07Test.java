package sem3pi.dei.isep.ipp.pt.esinf.sprint3;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.PathMaxHubs;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.map.MapGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI02;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3.USEI07;

import java.time.LocalTime;
import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class USEI07Test {

    Graph<Locals, Integer> graph = new MapGraph<>(false);

    @Test
    public void USEI07Works (){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        List<PathMaxHubs> result=new ArrayList<>();
        USEI07 usei07 = new USEI07();

        USEI02 usei02 = new USEI02();

        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 10);

        List<Edge<Locals,Integer>> ListEdges = new ArrayList<>();

        Map<String,Integer> stats = usei07.us07_method(graph,graph.vertices().get(0),ListEdges,hubs, LocalTime.of(10,30,0),70,150,100000,result);

        assertEquals(Optional.of(2).get(),stats.get("carregamentos"));
        assertEquals(Optional.of(377694).get(),stats.get("distanciaTotal"));
        assertEquals(Optional.of(18443).get(),stats.get("tempo total"));
    }


    @Test
    public void testUSEI07worksCorrectly(){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        List<PathMaxHubs> result=new ArrayList<>();
        USEI07 usei07 = new USEI07();

        USEI02 usei02 = new USEI02();

        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 3);

        List<Edge<Locals,Integer>> ListEdges = new ArrayList<>();


        Map<String,Integer> stats = usei07.us07_method(graph,graph.vertices().get(0),ListEdges,hubs, LocalTime.of(14,0,0),90,150,100000,result);

        assertEquals(Optional.of(1).get(),stats.get("carregamentos"));
        assertEquals(Optional.of(164631).get(),stats.get("distanciaTotal"));
        assertEquals(Optional.of(5820).get(),stats.get("tempo total"));
    }


    @Test
    public void testUSEI07LowAutonomy (){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        List<PathMaxHubs> result=new ArrayList<>();
        USEI07 usei07 = new USEI07();

        USEI02 usei02 = new USEI02();

        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 10);

        List<Edge<Locals,Integer>> ListEdges = new ArrayList<>();

        usei07.us07_method(graph,graph.vertices().get(0),ListEdges,hubs, LocalTime.of(10,30,0),70,150,1000,result);

        assertTrue(result.isEmpty());

    }

    @Test
    public void testUSEI07earlyHour (){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        List<PathMaxHubs> result=new ArrayList<>();
        USEI07 usei07 = new USEI07();

        USEI02 usei02 = new USEI02();

        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 10);

        List<Edge<Locals,Integer>> ListEdges = new ArrayList<>();

        usei07.us07_method(graph,graph.vertices().get(0),ListEdges,hubs, LocalTime.of(2,0,0),70,150,100000,result);
        assertTrue(result.isEmpty());

    }
}
