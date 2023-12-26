package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.InfoForUs08;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.util.*;

public class USEI06 {

    //retorno//
   /* public static InfoForUs06 findOptimalCircuit(Graph<Locals, Integer> graph, List<Locals> hubs, Locals initialVertex, int autonomy, double velocidadeMedia) {
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
    }*/

    // Lista com percursos//
    private static ArrayList<LinkedList<Locals>> getAllPathsWithinAutonomyDFS(Graph<Locals, Integer> g, Locals vOrig, Locals vDest, int autonomy) {
        ArrayList<LinkedList<Locals>> paths = new ArrayList<>();
        boolean[] visited = new boolean[g.numVertices()];
        LinkedList<Locals> path = new LinkedList<>();
        depthFirstSearchPaths(g, vOrig, vDest, visited, path, paths, autonomy);
        return paths;
    }




    //Cada ponto do percurso associado a um mapa (local, distancia)//
    private static void depthFirstSearchPaths(Graph<Locals, Integer> g, Locals vOrig, Locals vDest, boolean[] visited,
                                                     LinkedList<Locals> path, ArrayList<LinkedList<Locals>> paths, int autonomy) {
        int vOrigIndex = g.key(vOrig);
        int vDestIndex = g.key(vDest);

        path.add(vOrig);
        visited[vOrigIndex] = true;

        for (Locals verticeAdj : g.adjVertices(vOrig)) {
            Edge<Locals, Integer> edge = g.edge(vOrig, verticeAdj);
            int edgeWeight = (int) edge.getWeight();

            // Verifica se a adição da aresta não ultrapassa a autonomia
            if (path.isEmpty() || (getTotalPathDistance(g, path) + edgeWeight) <= autonomy) {
                if (verticeAdj == vDest) {
                    path.add(vDest);
                    paths.add(new LinkedList<>(path));
                    path.removeLast();
                } else if (!visited[g.key(verticeAdj)]) {
                    depthFirstSearchPaths(g, verticeAdj, vDest, visited, path, paths, autonomy);
                }
            }
        }

        visited[vOrigIndex] = false;
        path.removeLast();
    }



    //Distancia total//
    private static int getTotalPathDistance(Graph<Locals, Integer> g, LinkedList<Locals> path) {
        int totalDistance = 0;
        for (int i = 1; i < path.size(); i++) {
            Locals currentVertex = path.get(i - 1);
            Locals nextVertex = path.get(i);
            Edge<Locals, Integer> edge = g.edge(currentVertex, nextVertex);
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
    private static Map<List<Locals>, String> calculateTravelTimes(Graph<Locals, Integer> g, Locals vOrig, Locals vDest, int autonomy, int averageSpeed) {
        ArrayList<LinkedList<Locals>> paths = getAllPathsWithinAutonomyDFS(g, vOrig, vDest, autonomy);
        Map<List<Locals>, String> travelTimes = new HashMap<>();

        for (LinkedList<Locals> path : paths) {
            String travelTime = calculateTravelTime(averageSpeed, getTotalPathDistance(g, path));
            travelTimes.put(new ArrayList<>(path), travelTime);
        }

        return travelTimes;
    }


}



