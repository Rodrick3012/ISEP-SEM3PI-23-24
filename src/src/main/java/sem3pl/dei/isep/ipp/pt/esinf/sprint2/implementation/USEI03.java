package sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation;

import org.apache.commons.math3.random.AbstractRandomGenerator;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.ShortestPath;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Graph;

import java.util.*;
import java.util.function.BinaryOperator;

public class USEI03 {

    public ShortestPath getShortestPathBetweenTwoMostRemoteLocals(Integer autonomy){
        CommonGraph<Locals, Integer> graph = getGraph();
        Locals[] mostRemoteLocals = findMostRemoteLocals(graph.vertices());
        LinkedList<Locals> shortPath = new LinkedList<>();
        LinkedList<Integer> distancesBetweenPoints = new LinkedList<>();
        LinkedList<Locals> refuelingPoints = new LinkedList<>();
        Locals firstLocal = mostRemoteLocals[0];
        Locals lastLocal = mostRemoteLocals[1];
        Integer shortestPathDistance = shortestPath(graph, firstLocal,
                lastLocal, Integer::compare, Integer::sum, 0, shortPath,
                distancesBetweenPoints, Integer.MAX_VALUE, autonomy, refuelingPoints);
        if(shortestPathDistance != null) {
            return new ShortestPath(new ArrayList<>(shortPath), new ArrayList<>(refuelingPoints), new ArrayList<>(distancesBetweenPoints), shortestPathDistance, refuelingPoints.size());
        } else return new ShortestPath(new ArrayList<>(), new ArrayList<>(), new ArrayList<>(), 0, 0);
    }

    private CommonGraph<Locals, Integer> getGraph(){
        USEI01 usei01 = new USEI01();
        return usei01.readToGraph();
    }

    private Locals[] findMostRemoteLocals(List<Locals> localsList){
        Locals[] mostRemoteLocals = new Locals[2];
        double maxDistance = 0.0;
        for (int i = 0; i < localsList.size(); i++) {
            Locals local1 = localsList.get(i);
            for (int j = i+1;  j < localsList.size(); j++){
                Locals local2 = localsList.get(j);
                double distance = calculateDistance(local1.getLatitude(), local2.getLatitude(), local1.getLongitude(), local2.getLongitude());
                if(distance > maxDistance){
                    maxDistance = distance;
                    mostRemoteLocals[0] = local1;
                    mostRemoteLocals[1] = local2;
                }
            }
        }
        return mostRemoteLocals;
    }

    private double calculateDistance(double lat1, double lat2, double lon1, double lon2){
        double x = lat2 - lat1;
        double y = lon2 - lon1;
        return Math.sqrt(x*x + y*y);
    }

    public static <V, E> E shortestPath(Graph<V, E> g, V vOrig, V vDest,
                                        Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                        LinkedList<V> shortPath, LinkedList<E> distances,
                                        E infinity, E autonomy, LinkedList<V> refuelingPoints) {
        int numVertices = g.numVertices();

        // Arrays to store the result of Dijkstra's algorithm
        boolean[] visited = new boolean[numVertices];
        @SuppressWarnings("unchecked")
        V[] pathKeys = (V[]) new Object[numVertices];
        @SuppressWarnings("unchecked")
        E[] dist = (E[]) new Object[numVertices];

        if(!shortPath.isEmpty()){
            shortPath.clear();
        }

        // Run Dijkstra's algorithm
        shortestPathDijkstra(g, vOrig, ce, sum, zero, visited, pathKeys, dist, infinity);

        int vDestIndex = g.key(vDest);
        if (vDestIndex<0)
            return null;
        // Check if there is a path to the destination vertex
        if (dist[vDestIndex].equals(infinity)) {
            return null;
        }

        // Reconstruct the shortest path
        getPathWithDistances(g, vOrig, vDest, pathKeys, ce, sum, zero, shortPath, distances, refuelingPoints, autonomy);

        E accumulatedDistance = zero;
        for (V vertex : shortPath) {
            int vertexIndex = g.key(vertex);
            accumulatedDistance = sum.apply(accumulatedDistance, dist[vertexIndex]);

            // Check if refueling is needed at the current vertex
            if (ce.compare(accumulatedDistance, autonomy) > 0) {
                refuelingPoints.add(vertex);
                accumulatedDistance = zero;  // Reset accumulated distance after refueling
            }
        }

        refuelingPoints.add(vDest);

        // Return the length of the shortest path
        return dist[vDestIndex];
    }

    private static <V, E> void shortestPathDijkstra(Graph<V, E> g, V vOrig,
                                                    Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                                    boolean[] visited, V[] pathKeys, E[] dist, E infinity) {

        PriorityQueue<V> priorityQueue = new PriorityQueue<>(Comparator.comparing(v -> dist[g.key(v)], ce));
        for (V vertex : g.vertices()) {
            int vertexKey = g.key(vertex);
            visited[vertexKey] = false;
            dist[vertexKey] = infinity; // Consider using a default value instead of null
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

                // Update the distances to the neighbors of the current vertex
                for (V neighbor : g.adjVertices(currentVertex)) {
                    int neighborKey = g.key(neighbor);
                    E edgeWeight = g.edge(currentVertex, neighbor).getWeight();

                    E newDistance = sum.apply(dist[currentVertexKey], edgeWeight);

                    // Use the comparator to compare distances
                    if (ce.compare(newDistance, dist[neighborKey]) < 0) {
                        dist[neighborKey] = newDistance;
                        pathKeys[neighborKey] = currentVertex;
                        priorityQueue.add(neighbor);
                    }
                }
            }
        }
    }

    private static <V, E> void getPathWithDistances(Graph<V, E> g, V vOrig, V vDest, V[] pathKeys, Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                                    LinkedList<V> path, LinkedList<E> distances, LinkedList<V> refuelingPoints, E autonomy) {
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
                if(ce.compare(accumulatedDistance, autonomy) > 0){
                    refuelingPoints.addFirst(current);
                    accumulatedDistance = zero;
                }
            }
        }
    }

}
