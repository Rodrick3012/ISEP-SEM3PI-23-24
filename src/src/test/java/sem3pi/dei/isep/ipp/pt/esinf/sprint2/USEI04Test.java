package sem3pi.dei.isep.ipp.pt.esinf.sprint2;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.map.MapGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation.USEI04;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class USEI04Test {


    Graph<Locals, Integer> graph = new MapGraph<>(false);


    @Test
    public void testEx4() {
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph();

        USEI04 usei04 = new USEI04();
        // Executar o algoritmo de Prim
        List<Edge<Locals, Integer>> minimumSpanningTree = usei04.readDataForUs04();

        // Verificar se o número de arestas na árvore é correto
        assertEquals(graph.numVertices() - 1, minimumSpanningTree.size());

        // Calcular a distância total da rede
        int totalDistance = 0;
        for (Edge<Locals, Integer> edge : minimumSpanningTree) {
            totalDistance += edge.getWeight();
        }

        // Verificar se a distância total é correta
        assertEquals(4231982, totalDistance);  // Valor específico para o exemplo, ajuste conforme necessário
    }


}
