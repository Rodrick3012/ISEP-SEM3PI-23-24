package sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.map.MapGraph;

import java.util.*;

public class USEI04 {

    Graph<Locals, Integer> graph = new MapGraph<>(false);

    public List<Edge<Locals, Integer>> readDataForUs04() {
        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph();
        Locals newLocal1 = new Locals("CT43", 39.1167, -7.2833);

        return prim(graph);
    }

    public void methodForUiLapr(){

        USEI01 usei01 = new USEI01();
        graph = usei01.readToGraph();
        Locals newLocal1 = new Locals("CT43", 39.1167, -7.2833);

        List<Edge<Locals, Integer>> minimumSpanningTree = prim(graph);

        System.out.println("Minimum Spanning Tree:");
        int contadora = 0;
        double weightTotal = 0;
        for (Edge<Locals, Integer> edge : minimumSpanningTree) {
            System.out.println(edge.getVOrig().getId() + " - " + edge.getVDest().getId() + ": " + edge.getWeight());
            contadora++;
            weightTotal += edge.getWeight();
        }
        System.out.println("Número de vértices percorrido - "+ contadora+1);
        System.out.println("Número de vértices total - "+graph.numVertices());
        System.out.println("Distância total -"+ weightTotal);
    }


    public static List<Edge<Locals, Integer>> prim(Graph<Locals, Integer> graph) {
        Set<Locals> visited = new HashSet<>();
        List<Edge<Locals, Integer>> minimumSpanningTree = new ArrayList<>();

        Locals initialVertex = graph.vertices().iterator().next(); // Start from any vertex

        visited.add(initialVertex);

        PriorityQueue<Edge<Locals, Integer>> priorityQueue = new PriorityQueue<>(Comparator.comparingInt(Edge::getWeight));
        priorityQueue.addAll(graph.outgoingEdges(initialVertex));

        while (!priorityQueue.isEmpty() && visited.size() < graph.numVertices()) {
            Edge<Locals, Integer> minEdge = priorityQueue.poll();

            Locals nextVertex = minEdge.getVDest();

            if (!visited.contains(nextVertex)) {
                visited.add(nextVertex);
                minimumSpanningTree.add(minEdge);

                Collection<Edge<Locals, Integer>> neighbors = graph.outgoingEdges(nextVertex);
                if (neighbors != null) {
                    priorityQueue.addAll(neighbors);
                }
            }
        }

        return minimumSpanningTree;
    }

}