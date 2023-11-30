package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.ShortestPath;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;

import java.util.*;
import java.util.function.BinaryOperator;

public class USEI03 {

    public ShortestPath getShortestPathBetweenTwoMostRemoteLocals(Integer autonomy) {
        autonomy = autonomy * 1000;
        CommonGraph<Locals, Integer> graph = getGraph();
        Locals[] mostRemoteLocals = findMostRemoteLocals(graph.vertices());
        LinkedList<Locals> shortPath = new LinkedList<>();
        LinkedList<Integer> distancesBetweenPoints = new LinkedList<>();
        Locals firstLocal = mostRemoteLocals[0];
        Locals lastLocal = mostRemoteLocals[1];
        LinkedList<Locals> rechargePoints = new LinkedList<>();
        Map<String, Integer> distancesForUI = new HashMap<>();
        Integer shortestPathDistance = shortestPath(graph, firstLocal,
                lastLocal, Integer::compare, Integer::sum, 0, shortPath,
                distancesBetweenPoints, Integer.MAX_VALUE, autonomy, rechargePoints, distancesForUI);
        if (shortestPathDistance != null) {
            return new ShortestPath(new ArrayList<>(shortPath), new ArrayList<>(distancesBetweenPoints), shortestPathDistance/1000, rechargePoints.size());
        } else return new ShortestPath(new ArrayList<>(), new ArrayList<>(), 0, 0);
    }

    private CommonGraph<Locals, Integer> getGraph() {
        USEI01 usei01 = new USEI01();
        return usei01.readToGraph("src/main/resources/locais_big.csv", "src/main/resources/distancias_big.csv");
    }

    public ShortestPath getShortestPathBetweenTwoMostRemoteLocalsForUI(CommonGraph<Locals,Integer> graph, Integer autonomy) {
        autonomy = autonomy * 1000;
        Locals[] mostRemoteLocals = findMostRemoteLocals(graph.vertices());
        LinkedList<Locals> shortPath = new LinkedList<>();
        LinkedList<Integer> distancesBetweenPoints = new LinkedList<>();
        Locals firstLocal = mostRemoteLocals[0];
        Locals lastLocal = mostRemoteLocals[1];
        LinkedList<Locals> rechargePoints = new LinkedList<>();
        Map<String, Integer> distancesForUI = new HashMap<>();
        Integer shortestPathDistance = shortestPath(graph, firstLocal,
                lastLocal, Integer::compare, Integer::sum, 0, shortPath,
                distancesBetweenPoints, Integer.MAX_VALUE, autonomy, rechargePoints, distancesForUI);
        if (shortestPathDistance != null) {
            return new ShortestPath(new ArrayList<>(shortPath), new ArrayList<>(distancesBetweenPoints), shortestPathDistance/1000, rechargePoints.size(), distancesForUI);
        } else return new ShortestPath(new ArrayList<>(), new ArrayList<>(), 0, 0);
    }

    private Locals[] findMostRemoteLocals(List<Locals> localsList) {
        Locals[] mostRemoteLocals = new Locals[2];
        double maxDistance = 0.0;
        for (int i = 0; i < localsList.size(); i++) {
            Locals local1 = localsList.get(i);
            for (int j = i + 1; j < localsList.size(); j++) {
                Locals local2 = localsList.get(j);
                double distance = calculateDistance(local1.getLatitude(), local2.getLatitude(), local1.getLongitude(), local2.getLongitude());
                if (distance > maxDistance) {
                    maxDistance = distance;
                    mostRemoteLocals[0] = local1;
                    mostRemoteLocals[1] = local2;
                }
            }
        }
        return mostRemoteLocals;
    }

    private double calculateDistance(double lat1, double lat2, double lon1, double lon2) {
        double x = lat2 - lat1;
        double y = lon2 - lon1;
        return Math.sqrt(x * x + y * y);
    }

    public static <V, E> E shortestPath(Graph<V, E> g, V vOrig, V vDest,
                                        Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                        LinkedList<V> shortPath, LinkedList<E> distances,
                                        E infinity, E autonomy, LinkedList<V> chargingPoints, Map<String, E> distancesForUI) {
        int numVertices = g.numVertices();

        // Arrays to store the result of Dijkstra's algorithm
        boolean[] visited = new boolean[numVertices];
        @SuppressWarnings("unchecked")
        V[] pathKeys = (V[]) new Object[numVertices];
        @SuppressWarnings("unchecked")
        E[] dist = (E[]) new Object[numVertices];

        if (!shortPath.isEmpty()) {
            shortPath.clear();
        }

        // Run Dijkstra's algorithm
        shortestPathDijkstra(g, vOrig, ce, sum, zero, visited, pathKeys, dist, infinity, autonomy);

        int vDestIndex = g.key(vDest);
        if (vDestIndex < 0)
            return null;
        // Check if there is a path to the destination vertex
        if (dist[vDestIndex].equals(infinity)) {
            return null;
        }

        // Reconstruct the shortest path
        getPathWithDistances(g, vOrig, vDest, pathKeys, shortPath, distances, distancesForUI, ce, sum, zero, chargingPoints, autonomy);

        // Return the length of the shortest path
        return dist[vDestIndex];
    }

    private static <V, E> void shortestPathDijkstra(Graph<V, E> g, V vOrig,
                                                    Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                                    boolean[] visited, V[] pathKeys, E[] dist, E infinity, E autonomy) {

        PriorityQueue<V> priorityQueue = new PriorityQueue<>(Comparator.comparing(v -> dist[g.key(v)], ce));
        for (V vertex : g.vertices()) {
            int vertexKey = g.key(vertex);
            visited[vertexKey] = false;
            dist[vertexKey] = infinity;
            pathKeys[vertexKey] = null;
        }

        int vOrigKey = g.key(vOrig);
        dist[vOrigKey] = zero;
        priorityQueue.add(vOrig);

        while (!priorityQueue.isEmpty()) {
            V currentVertex = priorityQueue.poll();
            int currentVertexKey = g.key(currentVertex);

            if (!visited[currentVertexKey]) {
                visited[currentVertexKey] = true;

                for (V neighbor : g.adjVertices(currentVertex)) {
                    int neighborKey = g.key(neighbor);
                    E edgeWeight = g.edge(currentVertex, neighbor).getWeight();
                    E newDistance = sum.apply(dist[currentVertexKey], edgeWeight);

                    // Check if recharging is needed
                    if (ce.compare(newDistance, autonomy) > 0) {
                        // Calculate the distance to the nearest charging station
                        E chargingDistance = findNearestChargingStation(g, ce, currentVertex, autonomy);

                        // Check if a charging station is available and improves the situation
                        if (chargingDistance != null) {
                            E updatedDistance = sum.apply(dist[currentVertexKey], chargingDistance);

                            // Update the path only if it improves the situation
                            if (pathKeys[neighborKey] == null || ce.compare(updatedDistance, dist[neighborKey]) < 0) {
                                dist[neighborKey] = updatedDistance;
                                pathKeys[neighborKey] = currentVertex;
                                priorityQueue.add(neighbor);
                            }
                        }
                    } else {
                        // No recharging needed
                        // Update the path only if it improves the situation
                        if (pathKeys[neighborKey] == null || ce.compare(newDistance, dist[neighborKey]) < 0) {
                            dist[neighborKey] = newDistance;
                            pathKeys[neighborKey] = currentVertex;
                            priorityQueue.add(neighbor);
                        }
                    }
                }
            }
        }
    }


    private static <V, E> E findNearestChargingStation(Graph<V, E> g, Comparator<E> ce, V vertex, E remainingAutonomy) {
        E nearestChargingDistance = null;

        for (V chargingStation : g.adjVertices(vertex)) {
            E chargingDistance = g.edge(vertex, chargingStation).getWeight();

            if (ce.compare(chargingDistance, remainingAutonomy) <= 0) {
                if (nearestChargingDistance == null || ce.compare(chargingDistance, nearestChargingDistance) < 0) {
                    nearestChargingDistance = chargingDistance;
                }
            }
        }

        return nearestChargingDistance;
    }

    private static <V, E> void getPathWithDistances(Graph<V, E> g, V vOrig, V vDest, V[] pathKeys,
                                                    LinkedList<V> path, LinkedList<E> distances, Map<String, E> distancesForUI, Comparator<E> ce, BinaryOperator<E> sum, E zero, LinkedList<V> rechargePoints, E autonomy) {
        int vOrigIndex = g.vertices().indexOf(vOrig);
        int vDestIndex = g.vertices().indexOf(vDest);

        // Check if the origin and destination are the same
        if (vOrig.equals(vDest)) {
            path.add(vOrig);
            return;
        }

        // Reconstruct the path from the destination to the origin
        V current = vDest;
        E accumulatedDistance = zero;

        while (current != null) {
            path.addFirst(current);

            // Break the loop if the current vertex is equal to the origin vertex
            if (current.equals(vOrig)) {
                break;
            }

            // Retrieve the predecessor from the pathKeys array
            int currentVertexIndex = g.vertices().indexOf(current);
            current = pathKeys[currentVertexIndex];

            // Add the distance between the current and predecessor vertices
            if (current != null) {
                int predecessorIndex = g.vertices().indexOf(current);
                E edge = g.edge(predecessorIndex, currentVertexIndex).getWeight();
                accumulatedDistance = sum.apply(accumulatedDistance, edge);
                distances.addFirst(edge);
                distancesForUI.put(predecessorIndex + " -> " + currentVertexIndex, edge);
                if (ce.compare(accumulatedDistance, autonomy) > 0) {
                    rechargePoints.addFirst(current);
                    accumulatedDistance = zero;
                }
            }
        }
    }
}
