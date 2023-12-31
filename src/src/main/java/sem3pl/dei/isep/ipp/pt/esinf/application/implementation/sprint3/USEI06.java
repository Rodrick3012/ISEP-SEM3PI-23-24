package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.InfoForUs06;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.ResultDataTotalSemi;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.util.*;

public class USEI06 {

    //retorno//
    public static InfoForUs06 organizeInformation(Graph<Locals, Integer> g, Locals vOrig, Locals vDest, int autonomy, int averageSpeed) {

        Map<LinkedList<Locals>, ResultDataTotalSemi> pathsData = getAllPathsWithinAutonomyDFS(g, vOrig, vDest, autonomy, averageSpeed);


        return new InfoForUs06(pathsData);
    }


    // Lista com percursos//
    public static Map<LinkedList<Locals>, ResultDataTotalSemi> getAllPathsWithinAutonomyDFS(Graph<Locals, Integer> g, Locals vOrig, Locals vDest, int autonomy, int averageSpeed) {
        Map<LinkedList<Locals>, ResultDataTotalSemi> pathsData = new HashMap<>();
        boolean[] visited = new boolean[g.numVertices()];
        LinkedList<Locals> path = new LinkedList<>();
        depthFirstSearchPaths(g, vOrig, vDest, visited, path, pathsData, autonomy, averageSpeed);
        return pathsData;
    }


    //Cada ponto do percurso associado a um mapa (local, distancia)//
    private static void depthFirstSearchPaths(Graph<Locals, Integer> g, Locals vOrig, Locals vDest, boolean[] visited,
                                              LinkedList<Locals> path, Map<LinkedList<Locals>, ResultDataTotalSemi> pathsData, int autonomy, int averageSpeed) {
        int vOrigIndex = g.key(vOrig);
        int vDestIndex = g.key(vDest);

        path.add(vOrig);
        visited[vOrigIndex] = true;

        for (Locals verticeAdj : g.adjVertices(vOrig)) {


            if (verticeAdj == vDest && getTotalPathData(g, path, averageSpeed).getTotalDistance() <= autonomy * 1000) {
                path.add(vDest);
                ResultDataTotalSemi resultDataTotalSemi = getTotalPathData(g, path, averageSpeed);
                //System.out.println(getTotalPathData(g, path, averageSpeed).getTotalDistance() <= autonomy * 1000);
                if (getTotalPathData(g, path, averageSpeed).getTotalDistance() <= autonomy * 1000) {
                    pathsData.put(new LinkedList<>(path), resultDataTotalSemi);
                }
                path.removeLast();
            } else if (!visited[g.key(verticeAdj)] && getTotalPathData(g, path, averageSpeed).getTotalDistance() <= autonomy * 1000) {
                depthFirstSearchPaths(g, verticeAdj, vDest, visited, path, pathsData, autonomy, averageSpeed);
            }


        }

        visited[vOrigIndex] = false;
        path.removeLast();
    }


    //Distancia total//
    private static ResultDataTotalSemi getTotalPathData(Graph<Locals, Integer> g, LinkedList<Locals> path, int averageSpeed) {
        String travelTime = null;
        int totalDistance = 0;
        LinkedHashMap<Locals, Integer> distances = new LinkedHashMap<>();

        // O primeiro local tem distância

        Locals firstLocal = path.getFirst();
        for (int i = 1; i < path.size(); i++) {
            Locals currentVertex = path.get(i - 1);
            Locals nextVertex = path.get(i);
            Edge<Locals, Integer> edge = g.edge(currentVertex, nextVertex);
            int edgeWeight = edge.getWeight();


            distances.put(nextVertex, edgeWeight);
            totalDistance += edgeWeight;
        }
        travelTime = calculateTravelTime(averageSpeed, totalDistance);

        return new ResultDataTotalSemi(totalDistance, distances, travelTime, firstLocal);
    }


    //Metodo para caluclar o tempo de uma viagem//
    public static String calculateTravelTime(int averageSpeed, int totalDistance) {
        // Calculate the total time in hours
        double totalTimeHours = (double) totalDistance / (averageSpeed * 1000);

        // Convert the total time to the format hours, minutes, and seconds
        int hours = (int) totalTimeHours;
        int minutes = (int) ((totalTimeHours - hours) * 60);
        int seconds = (int) (((totalTimeHours - hours) * 60 - minutes) * 60);

        // Display the result
        return "Total travel time: " + hours + " hours, " + minutes + " minutes, " + seconds + " seconds.";
    }

}



