package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;

import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class USEI06 {

    // Lista com percursos//
    private static <V, E> ArrayList<LinkedList<V>> getAllPathsWithinAutonomy(Graph<V, E> g, V vOrig, V vDest, int autonomy) {
        ArrayList<LinkedList<V>> paths = new ArrayList<>();
        boolean[] visited = new boolean[g.numVertices()];
        LinkedList<V> path = new LinkedList<>();
        getAllPaths(g, vOrig, vDest, visited, path, paths, autonomy);
        return paths;
    }




    //Cada ponto do percurso associado a um mapa (local, distancia)//
    private static <V, E> void getAllPaths(Graph<V, E> g, V vOrig, V vDest, boolean[] visited,
                                           LinkedList<V> path, ArrayList<LinkedList<V>> paths, int autonomy) {
        int vOrigIndex = g.key(vOrig);
        int vDestIndex = g.key(vDest);

        Map<V, Integer> vertexWeights = new HashMap<>();
        visited[vOrigIndex] = true;

        for (V verticeAdj : g.adjVertices(vOrig)) {
            Edge<V, E> edge = g.edge(vOrig, verticeAdj);
            int edgeWeight = (int) edge.getWeight();

            // Verifica se a adição da aresta não ultrapassa a autonomia
            if (path.isEmpty() || (getTotalPathDistance(g, path) + edgeWeight) <= autonomy) {
                path.add(verticeAdj);
                vertexWeights.put(verticeAdj, edgeWeight);

                if (verticeAdj == vDest) {
                    paths.add(new LinkedList<>(path));
                } else if (!visited[g.key(verticeAdj)]) {
                    getAllPaths(g, verticeAdj, vDest, visited, path, paths, autonomy);
                }

                path.removeLast();
                vertexWeights.remove(verticeAdj);
            }
        }

        visited[vOrigIndex] = false;
    }



    //Distancia total//
    private static <V, E> int getTotalPathDistance(Graph<V, E> g, LinkedList<V> path) {
        int totalDistance = 0;
        for (int i = 1; i < path.size(); i++) {
            V currentVertex = path.get(i - 1);
            V nextVertex = path.get(i);
            Edge<V, E> edge = g.edge(currentVertex, nextVertex);
            int edgeWeight = (int) edge.getWeight();
            totalDistance += edgeWeight;
        }
        return totalDistance;
    }




    //Metodo para caluclar o tempo de uma viagem//
    private static String calculateTravelTime(int averageSpeed, int totalDistance) {
        // Calculate the total time in hours
        double totalTimeHours = (double) totalDistance / averageSpeed;

        // Convert the total time to the format hours, minutes, and seconds
        int hours = (int) totalTimeHours;
        int minutes = (int) ((totalTimeHours - hours) * 60);
        int seconds = (int) (((totalTimeHours - hours) * 60 - minutes) * 60);

        // Display the result
        return "Total travel time: " + hours + " hours, " + minutes + " minutes, " + seconds + " seconds.";
    }



    //Associar a uma viagem um tempo//
    private static <V,E> Map<LinkedList<V>, String> calculateTravelTimes(Graph<V, E> g, V vOrig, V vDest, int autonomy, int averageSpeed) {
        ArrayList<LinkedList<V>> paths = getAllPathsWithinAutonomy(g, vOrig, vDest, autonomy);
        Map<LinkedList<V>, String> travelTimes = new HashMap<>();

        for (LinkedList<V> path : paths) {
            String travelTime = calculateTravelTime(averageSpeed, getTotalPathDistance(g, path));
            travelTimes.put(path, travelTime);
        }

        return travelTimes;
    }


}



