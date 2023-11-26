package sem3pi.dei.isep.ipp.pt.esinf.sprint2;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.map.MapGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.matrix.MatrixGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation.USEI02;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class USEI02Test {

    Graph<Locals, Integer> graph = new MapGraph<>(false);
    @Test
    public void testOptimizeLocations() {
        // Criar grafo de localizações
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");

        USEI02 usei02 = new USEI02();

        // Chamar o método de otimização
        int numberOfHubs = 3; // Defina o número desejado de hubs
        ArrayList<List<LocationCriteria>> result = usei02.optimizeLocations(graph, numberOfHubs);

        // Verificar se as listas não são nulas
        assertNotNull(result);
        assertNotNull(result.get(0)); // Lista de centralidade
        assertNotNull(result.get(1)); // Lista de influência

        // Verificar se as listas têm o tamanho esperado
        assertEquals(numberOfHubs, result.get(0).size());
        assertEquals(numberOfHubs, result.get(1).size());

        // Adicionar mais verificações conforme necessário

        // Exemplo: Verificar se a lista está ordenada por ordem decrescente de centralidade
        int previousCentrality = Integer.MAX_VALUE;
        for (LocationCriteria criteria : result.get(0)) {
            assertTrue(criteria.getCentrality() <= previousCentrality);
            previousCentrality = criteria.getCentrality();
        }

        // Exemplo: Verificar se a lista está ordenada por ordem decrescente de influência
        int previousInfluence = Integer.MAX_VALUE;
        for (LocationCriteria criteria : result.get(1)) {
            assertTrue(criteria.getInfluence() <= previousInfluence);
            previousInfluence = criteria.getInfluence();
        }
    }


}
