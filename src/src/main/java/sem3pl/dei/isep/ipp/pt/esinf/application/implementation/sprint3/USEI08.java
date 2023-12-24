package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.InfoForUs08;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Algorithms;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.map.MapGraph;

import java.util.*;
import java.util.stream.Collectors;

public class USEI08 {

    List<Locals> melhorCaminho = new ArrayList<>();

    public static InfoForUs08 findOptimalCircuit(Graph<Locals, Integer> graph, List<Locals> hubs, Locals initialVertex, int autonomy, double velocidadeMedia) {
        LinkedList<Locals> chargingPoints = new LinkedList<>();
        List<Edge<Locals, Integer>> optimalCircuitEdges = new ArrayList<>();
        Set<Locals> visited = initializeVisitedSet(hubs,initialVertex);
        LinkedList<Integer> distances = new LinkedList<>();
        Map<String,Integer> mapForUi = new HashMap<>();


        tsp(graph,initialVertex, optimalCircuitEdges, visited, initialVertex,chargingPoints,autonomy,mapForUi,distances);
        int distanciaTotal = calculateTotalDistance(graph,optimalCircuitEdges);
        double tempoCircuito = distanciaTotal/velocidadeMedia;
        InfoForUs08 infoForUs08 = new InfoForUs08(optimalCircuitEdges,distanciaTotal,chargingPoints.size(),tempoCircuito);
        return infoForUs08;
    }

    private static void tsp(Graph<Locals, Integer> graph, Locals currentVertex,
                            List<Edge<Locals, Integer>> circuitEdges, Set<Locals> remainingHubs, Locals inicialVertice,LinkedList<Locals> chargingPoints,int autonomy, Map<String,Integer> mapForUi, LinkedList<Integer> distances) {
        // Adiciona o vértice atual ao circuito
        LinkedList<Locals> minPathForHub = new LinkedList<>();

        // Verifica se todos os hubs foram visitados
        boolean allHubsVisited = remainingHubs.isEmpty();

        if (allHubsVisited) {
            // Todos os hubs foram visitados, adiciona o vértice inicial ao circuito
            Algorithms.shortestPathWithAutonomy(graph,currentVertex,inicialVertice,Integer::compare, Integer::sum, 0, minPathForHub,distances, Integer.MAX_VALUE,autonomy,chargingPoints,mapForUi);

            circuitEdges.addAll(getEdgesFromPath(graph,minPathForHub));
            return;
        }

        // Inicializa uma lista para armazenar os hubs não visitados

        int minDistance = Integer.MAX_VALUE;
        Locals nextHub = null;

        // Encontrar próximo hub mais próximo
        for (Locals hub : remainingHubs) {
            LinkedList<Locals> path = new LinkedList<>();
            Integer distance = Algorithms.shortestPath(graph, currentVertex, hub, Integer::compare, Integer::sum, 0, path, Integer.MAX_VALUE);

            if (distance.intValue() < minDistance) {
                minDistance = distance;
                nextHub = hub;
                minPathForHub = path;
            }
        }
        remainingHubs.remove(nextHub);

        // Adiciona as arestas do caminho mínimo ao circuito
        circuitEdges.addAll(getEdgesFromPath(graph, minPathForHub));

        // Chama recursivamente para o próximo hub
        tsp(graph,nextHub, circuitEdges, remainingHubs, inicialVertice,chargingPoints,autonomy,mapForUi,distances);
    }


    private static Set<Locals> initializeVisitedSet(List<Locals> hubs, Locals inicialVertice) {
        Set<Locals> visited = new HashSet<>();
        visited.add(inicialVertice);
        visited.addAll(hubs);
        return visited;
    }

    public static boolean areAllHubsPresent(List<Edge<Locals, Integer>> edges, List<Locals> hubs) {
        for (Locals hub : hubs) {
            int count = 0;

            for (Edge<Locals, Integer> edge : edges) {
                if (edge.getVOrig().equals(hub) || edge.getVDest().equals(hub)) {
                    count++;
                }
            }

            if (count != 2) {
                return false;  // Hub doesn't appear exactly twice
            }
        }

        return true;  // All hubs appear exactly twice in the list of edges
    }
    private static List<Edge<Locals, Integer>> getEdgesFromPath(Graph<Locals, Integer> graph, List<Locals> pathLocals) {
        List<Edge<Locals, Integer>> edges = new ArrayList<>();

        for (int i = 0; i < pathLocals.size() - 1; i++) {
            Locals sourceVertex = pathLocals.get(i);
            Locals targetVertex = pathLocals.get(i + 1);
            Edge<Locals, Integer> edge = graph.edge(sourceVertex, targetVertex);
            if (edge != null) {
                edges.add(edge);
            }
        }

        return edges;
    }
    public static <Locals, Integer> int calculateTotalDistance(Graph<Locals, java.lang.Integer> graph, List<Edge<Locals, Integer>> edges) {
        int totalDistance = 0;

        for (Edge<Locals, Integer> edge : edges) {
            Integer weight = edge.getWeight();

                totalDistance +=(int) weight;

        }

        return totalDistance;
    }


}