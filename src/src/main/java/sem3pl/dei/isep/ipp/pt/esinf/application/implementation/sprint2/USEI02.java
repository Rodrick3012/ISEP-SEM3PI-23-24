
package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Algorithms;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.util.*;

public class USEI02 {


    private static HashMap<Locals, Integer> calculateCentrality(Graph<Locals, Integer> graph) {
        HashMap<Locals, Integer> centralityMap = new HashMap<>();

        for (Locals locals : graph.vertices()) {
            List<Locals> vertices = new ArrayList<>(graph.vertices());
            int centrality = 0;

            for (Locals v : vertices) {
                if (!v.equals(locals)) {
                    List<Locals> path = Algorithms.getShortestPath(graph, locals, v);
                    if (path != null && !path.isEmpty()) {
                        centrality++;
                    }
                }
            }

            centralityMap.put(locals, centrality);
        }
        return centralityMap;
    }

    private static HashMap<Locals, Integer> calculateInfluence(Graph<Locals, Integer> graph) {
        HashMap<Locals, Integer> influenceMap = new HashMap<>();

        for (Locals locals : graph.vertices()) {
            influenceMap.put(locals, graph.inDegree(locals) + graph.outDegree(locals));
        }

        return influenceMap;
    }

    public static ArrayList<List<LocationCriteria>> optimizeLocations(Graph<Locals, Integer> graph, int numberOfHubs) {
        List<LocationCriteria> locationCriteriaList = new ArrayList<>();

        // Calcular centralidade para cada vértice
        HashMap<Locals, Integer> centralityMap = calculateCentrality(graph);

        // Calcular influência para cada vértice
        HashMap<Locals, Integer> influenceMap = calculateInfluence(graph);

        // Criar lista de critérios para cada localização
        for (Locals locals : graph.vertices()) {
            int influence = influenceMap.get(locals);
            int centrality = centralityMap.get(locals);
            locationCriteriaList.add(new LocationCriteria(locals, influence, centrality));
        }
        // Ordenar a lista por ordem decrescente de centralidade e influência
        locationCriteriaList.sort(Comparator.comparing(LocationCriteria::getInfluence).reversed()
                .thenComparing(Comparator.comparing(LocationCriteria::getCentrality).reversed()));

        // Retornar os N primeiros elementos (hubs)
        List<LocationCriteria> selectedHubs = locationCriteriaList.subList(0, Math.min(numberOfHubs, locationCriteriaList.size()));

        // Separar as listas de centralidade e influência
        List<LocationCriteria> centralityList = new ArrayList<>();
        List<LocationCriteria> influenceList = new ArrayList<>();
        for (LocationCriteria criteria : selectedHubs) {
            centralityList.add(new LocationCriteria(criteria.getLocation(), 0, criteria.getCentrality()));
            influenceList.add(new LocationCriteria(criteria.getLocation(), criteria.getInfluence(), 0));
        }

        // Imprimir os resultados
        System.out.println("Locais selecionados como hubs:");
        for (LocationCriteria criteria : selectedHubs) {
            System.out.println("Localização: " + criteria.getLocation().getId() +
                    ", Centralidade: " + criteria.getCentrality() +
                    ", Influência: " + criteria.getInfluence());

        }

        ArrayList<List<LocationCriteria>> result = new ArrayList<>();
        result.add(centralityList);
        result.add(influenceList);


        return result;
    }


}

