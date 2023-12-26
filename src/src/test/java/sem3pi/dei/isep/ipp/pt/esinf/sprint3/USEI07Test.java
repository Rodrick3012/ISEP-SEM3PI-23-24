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

public class USEI07Test {

    Graph<Locals, Integer> graph = new MapGraph<>(false);

    @Test
    public void testForVerticeOrdenation (){
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
        List<PathMaxHubs> result=new ArrayList<>();
        USEI07 usei07 = new USEI07();

        USEI02 usei02 = new USEI02();

        List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, 5);

        List<Edge<Locals,Integer>> ListEdges = new ArrayList<>();

        Map<String,Integer> stats = usei07.us07_method(graph,graph.vertices().get(0),ListEdges,hubs, LocalTime.of(9,30,0),70,150,result);


        for(PathMaxHubs i : result){
            System.out.println("Local: " + i.getLocais() + ", Hub: " + i.getHub()+ ", Chegada: " + i.getChegada()+ ", Partida: " + i.getPartida());
        }

        System.out.println(stats);

    }
}
