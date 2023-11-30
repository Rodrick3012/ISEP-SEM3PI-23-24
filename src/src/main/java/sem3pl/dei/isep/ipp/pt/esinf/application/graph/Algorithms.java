package sem3pl.dei.isep.ipp.pt.esinf.application.graph;


import sem3pl.dei.isep.ipp.pt.esinf.application.graph.matrix.MatrixGraph;

import java.util.*;
import java.util.function.BinaryOperator;

/**
 * @author DEI-ISEP
 */
public class Algorithms {

    /**
     * Performs breadth-first search of a Graph starting in a vertex
     *
     * @param g    Graph instance
     * @param vert vertex that will be the source of the search
     * @return a LinkedList with the vertices of breadth-first search
     */
    public static <V, E> LinkedList<V> BreadthFirstSearch(Graph<V, E> g, V vert) {
        if (!g.validVertex(vert))
            return null;

        LinkedList<V> qbfs = new LinkedList<>();
        LinkedList<V> qaux = new LinkedList<>();
        boolean[] visited = new boolean[g.numVertices()];

        int vOrigKey = g.key(vert);
        qbfs.add(vert);
        qaux.add(vert);
        visited[vOrigKey] = true;

        while (!qaux.isEmpty()) {
            V currentVertex = qaux.remove();

            for (V vAdj : g.adjVertices(currentVertex)) {
                int vAdjKey = g.key(vAdj);
                if (!visited[vAdjKey]) {
                    qbfs.add(vAdj);
                    qaux.add(vAdj);
                    visited[vAdjKey] = true;
                }
            }
        }

        return qbfs;
    }

    /**
     * Performs depth-first search starting in a vertex
     *
     * @param g       Graph instance
     * @param vOrig   vertex of graph g that will be the source of the search
     * @param visited set of previously visited vertices
     * @param qdfs    return LinkedList with vertices of depth-first search
     */
    private static <V, E> void depthFirstSearch(Graph<V, E> g, V vOrig, boolean[] visited, LinkedList<V> qdfs) {
        int vOrigKey = g.key(vOrig);

        if (!visited[vOrigKey]) {
            qdfs.add(vOrig);
            visited[vOrigKey] = true;

            for (V vAdj : g.adjVertices(vOrig)) {
                int vAdjKey = g.key(vAdj);
                depthFirstSearch(g, vAdj, visited, qdfs);
            }
        }
    }

    /**
     * Performs depth-first search starting in a vertex
     *
     * @param g    Graph instance
     * @param vert vertex of graph g that will be the source of the search
     * @return a LinkedList with the vertices of depth-first search
     */
    public static <V, E> LinkedList<V> depthFirstSearch(Graph<V, E> g, V vert) {
        boolean[] visited = new boolean[g.numVertices()];
        LinkedList<V> qdfs = new LinkedList<>();
        if (!g.validVertex(vert))
            return null;
        depthFirstSearch(g, vert, visited, qdfs);
        return qdfs;
    }

    /**
     * Returns all paths from vOrig to vDest
     *
     * @param g       Graph instance
     * @param vOrig   Vertex that will be the source of the path
     * @param vDest   Vertex that will be the end of the path
     * @param visited set of discovered vertices
     * @param path    stack with vertices of the current path (the path is in reverse order)
     * @param paths   ArrayList with all the paths (in correct order)
     */
    private static <V, E> void allPaths(Graph<V, E> g, V vOrig, V vDest, boolean[] visited,
                                        LinkedList<V> path, ArrayList<LinkedList<V>> paths) {
        int vOrigIndex = g.key(vOrig);
        int vDestIndex = g.key(vDest);


        path.push(vOrig);
        visited[vOrigIndex] = true;

        for (V verticeAdj : g.adjVertices(vOrig)) {
            if (verticeAdj == vDest) {
                path.push(vDest);
                paths.add(path);
                path.pop();
            } else if (!visited[g.key(verticeAdj)])
                allPaths(g, verticeAdj, vDest, visited, path, paths);
        }
        path.pop();
    }


    /**
     * Returns all paths from vOrig to vDest
     *
     * @param g     Graph instance
     * @param vOrig information of the Vertex origin
     * @param vDest information of the Vertex destination
     * @return paths ArrayList with all paths from vOrig to vDest
     */
    public static <V, E> ArrayList<LinkedList<V>> allPaths(Graph<V, E> g, V vOrig, V vDest) {
        ArrayList<LinkedList<V>> paths = new ArrayList<>();
        boolean[] visited = new boolean[g.numVertices()];
        LinkedList<V> path = new LinkedList<>();
        allPaths(g, vOrig, vDest, visited, path, paths);
        return paths;
    }


    /**
     * Computes shortest-path distance from a source vertex to all reachable
     * vertices of a graph g with non-negative edge weights
     * This implementation uses Dijkstra's algorithm
     *
     * @param g        Graph instance
     * @param vOrig    Vertex that will be the source of the path
     * @param visited  set of previously visited vertices
     * @param pathKeys minimum path vertices keys
     * @param dist     minimum distances
     */
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

    /**
     * Shortest-path between two vertices
     *
     * @param g         graph
     * @param vOrig     origin vertex
     * @param vDest     destination vertex
     * @param ce        comparator between elements of type E
     * @param sum       sum two elements of type E
     * @param zero      neutral element of the sum in elements of type E
     * @param shortPath returns the vertices which make the shortest path
     * @return the length of the shortest path if vertices exist in the graph and are connected, or null otherwise
     */
    @SuppressWarnings("unchecked")
    public static <V, E> E shortestPath(Graph<V, E> g, V vOrig, V vDest,
                                        Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                        LinkedList<V> shortPath, E infinity) {
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
        shortestPathDijkstra(g, vOrig, ce, sum, zero, visited, pathKeys, dist, infinity);

        int vDestIndex = g.key(vDest);
        if (vDestIndex < 0)
            return null;
        // Check if there is a path to the destination vertex
        if (dist[vDestIndex].equals(infinity)) {
            return null;
        }

        // Reconstruct the shortest path
        getPath(g, vOrig, vDest, pathKeys, shortPath);

        // Return the length of the shortest path
        return dist[vDestIndex];
    }

    /**
     * Extracts from pathKeys the minimum path between voInf and vdInf
     * The path is constructed from the end to the beginning
     *
     * @param g        Graph instance
     * @param vOrig    information of the Vertex origin
     * @param vDest    information of the Vertex destination
     * @param pathKeys minimum path vertices keys
     * @param path     stack with the minimum path (correct order)
     */
    private static <V, E> void getPath(Graph<V, E> g, V vOrig, V vDest,
                                       V[] pathKeys, LinkedList<V> path) {
        int vOrigIndex = g.vertices().indexOf(vOrig);
        int vDestIndex = g.vertices().indexOf(vDest);

        // Check if the origin and destination are the same
        if (vOrig.equals(vDest)) {
            path.add(vOrig);
            return;
        }

        // Reconstruct the path from the destination to the origin
        V current = vDest;

        // Set to keep track of visited vertices
        Set<V> visitedVertices = new HashSet<>();

        while (current != null) {
            if (!visitedVertices.contains(current)) {
                visitedVertices.add(current);
                path.addFirst(current);
            } else {
                // Break the loop if the current vertex has already been visited
                break;
            }

            // Break the loop if the current vertex is equal to the origin vertex
            if (current.equals(vOrig)) {
                break;
            }

            // Retrieve the predecessor from the pathKeys array
            int currentVertexIndex = g.vertices().indexOf(current);
            current = pathKeys[currentVertexIndex];
        }
    }

    /**
     * Calculates the minimum distance graph using Floyd-Warshall
     *
     * @param g   initial graph
     * @param ce  comparator between elements of type E
     * @param sum sum two elements of type E
     * @return the minimum distance graph
     */
    public static <V, E> MatrixGraph<V, E> minDistGraph(Graph<V, E> g, Comparator<E> ce, BinaryOperator<E> sum) {
        int numVertices = g.numVertices();
        MatrixGraph<V, E> minDistGraph = new MatrixGraph<>(true, numVertices);

        // Initialize the matrix with the weights of the original graph
        for (int i = 0; i < numVertices; i++) {
            for (int j = 0; j < numVertices; j++) {
                if (i == j) {
                    minDistGraph.addEdge(g.vertex(i), g.vertex(j), null);
                } else {
                    Edge<V, E> edge = g.edge(g.vertex(i), g.vertex(j));
                    if (edge != null) {
                        minDistGraph.addEdge(g.vertex(i), g.vertex(j), edge.getWeight());
                    } else {
                        // Use a special value (infinity) to represent absence of edge
                        // You can customize this based on your requirements
                        minDistGraph.addEdge(g.vertex(i), g.vertex(j), null);
                    }
                }
            }
        }

        // Floyd-Warshall algorithm
        for (int k = 0; k < numVertices; k++) {
            for (int i = 0; i < numVertices; i++) {
                for (int j = 0; j < numVertices; j++) {
                    if (minDistGraph.edge(g.vertex(i), g.vertex(k)) != null &&
                            minDistGraph.edge(g.vertex(k), g.vertex(j)) != null) {
                        E distIK = minDistGraph.edge(g.vertex(i), g.vertex(k)).getWeight();
                        E distKJ = minDistGraph.edge(g.vertex(k), g.vertex(j)).getWeight();
                        E distIJ = minDistGraph.edge(g.vertex(i), g.vertex(j)).getWeight();

                        // If distIK + distKJ is smaller than distIJ, update the distance
                        if (distIK != null && distKJ != null &&
                                (distIJ == null || ce.compare(distIK, sum.apply(distIK, distKJ)) < 0)) {
                            minDistGraph.addEdge(g.vertex(i), g.vertex(j), sum.apply(distIK, distKJ));
                        }
                    }
                }
            }
        }

        return minDistGraph;
    }

    /**
     * Shortest-path between a vertex and all other vertices
     *
     * @param g     graph
     * @param vOrig start vertex
     * @param ce    comparator between elements of type E
     * @param sum   sum two elements of type E
     * @param zero  neutral element of the sum in elements of type E
     * @param paths returns all the minimum paths
     * @param dists returns the corresponding minimum distances
     * @return if vOrig exists in the graph true, false otherwise
     */
    @SuppressWarnings("unchecked")
    public static <V, E> boolean shortestPaths(Graph<V, E> g, V vOrig,
                                               Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                               ArrayList<LinkedList<V>> paths, ArrayList<E> dists, E infinity) {

        int numVertices = g.numVertices();

        // Arrays to store the result of Dijkstra's algorithm
        boolean[] visited = new boolean[numVertices];
        V[] pathKeys = (V[]) new Object[numVertices];
        E[] dist = (E[]) new Object[numVertices];

        // Run Dijkstra's algorithm
        shortestPathDijkstra(g, vOrig, ce, sum, zero, visited, pathKeys, dist, infinity);

        // Check if the start vertex exists in the graph
        int vOrigIndex = g.vertices().indexOf(vOrig);

        // Check if the start vertex exists in the graph
        if (vOrigIndex == -1) {
            return false;
        }

        // Initialize the result lists
        paths.clear();
        dists.clear();

        for (int i = 0; i < numVertices; i++) {
            // If the vertex is not reachable, skip it

            // Reconstruct the shortest path
            LinkedList<V> path = new LinkedList<>();
            getPath(g, vOrig, g.vertex(i), pathKeys, path);
            paths.add(path);
            dists.add(dist[i]);
        }

        return true;
    }

    private static <V> List<V> reconstructPath(Map<V, V> predecessors, V start, V end) {
        List<V> path = new LinkedList<>();
        V current = end;

        while (current != null) {
            path.add(current);
            current = predecessors.get(current);
        }

        // Inverte a lista para obter o caminho do início até o destino
        Collections.reverse(path);
        return path;
    }

    public static <V, E> List<V> getShortestPath(Graph<V, E> graph, V start, V end) {
        Queue<V> queue = new LinkedList<>();
        Map<V, V> predecessors = new HashMap<>();

        // Inicialização
        queue.add(start);
        predecessors.put(start, null);

        // BFS para encontrar o caminho mínimo
        while (!queue.isEmpty()) {
            V current = queue.poll();

            if (current == end) {
                // Encontrou o destino, reconstrói o caminho e retorna
                return reconstructPath(predecessors, start, end);
            }

            for (V neighbor : graph.adjVertices(current)) {
                if (!predecessors.containsKey(neighbor)) {
                    queue.add(neighbor);
                    predecessors.put(neighbor, current);
                }
            }
        }

        // Se o destino não foi alcançado, retorna uma lista vazia
        return Collections.emptyList();
    }


}



