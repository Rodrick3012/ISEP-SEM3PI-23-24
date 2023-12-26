package sem3pl.dei.isep.ipp.pt.esinf.application.domain;


import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.util.*;

public class infoForUs06<V, E> {


    private ArrayList<LinkedList<V>> paths;
    private Map<LinkedList<V>, String> travelTimes;

    public infoForUs06() {
        this.paths = new ArrayList<>();
        this.travelTimes = new HashMap<>();
    }

    public void addPath(LinkedList<V> path, String travelTime) {
        paths.add(path);
        travelTimes.put(path, travelTime);
    }

    public ArrayList<LinkedList<V>> getPaths() {
        return paths;
    }

    public Map<LinkedList<V>, String> getTravelTimes() {
        return travelTimes;
    }

    // Outros métodos ou propriedades que você possa querer adicionar

    // Exemplo de método para imprimir informações
    public void printTravelSet(Graph<V, E> g) {
        for (LinkedList<V> path : paths) {
            System.out.println("Path: " + path);
            System.out.println("Travel Time: " + travelTimes.get(path));

            int totalDistance = 0;
            for (int i = 1; i < path.size(); i++) {
                V currentVertex = path.get(i - 1);
                V nextVertex = path.get(i);
                Edge<V, E> edge = g.edge(currentVertex, nextVertex);
                int edgeWeight = (int) edge.getWeight();
                totalDistance += edgeWeight;

                System.out.println("Distance between " + currentVertex + " and " + nextVertex + ": " + edgeWeight);
            }
            System.out.println("Total Distance: " + totalDistance);
            System.out.println();
        }
    }
}



