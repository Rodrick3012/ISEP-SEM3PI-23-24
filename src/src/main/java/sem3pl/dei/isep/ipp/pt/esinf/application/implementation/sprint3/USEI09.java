package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Algorithms;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.util.*;
import java.util.function.BinaryOperator;


public class USEI09 {
    public Map<Locals, Set<Locals>> organizeClusters(Graph<Locals, Integer> g, Integer nClusters) {
        Map<Locals, Set<Locals>> hubsAndClusters = new HashMap<>();
        if (g != null) {
            organizeClusters(g, hubsAndClusters, Integer::compare, Integer::sum, 0, Integer.MAX_VALUE, nClusters);
        }
        return hubsAndClusters;
    }

    private static <V, E> void organizeClusters(Graph<V, E> g, Map<V, Set<V>> hubsAndClusters, Comparator<E> ce, BinaryOperator<E> sum, E zero, E infinity, Integer nClusters) {
        Set<V> visited = new HashSet<>();

        while (hubsAndClusters.size() < nClusters) {
            Edge<V, E> edgeToRemove = findEdgeWithMaxShortestPaths(g, ce, sum, zero, infinity, visited);
            if (edgeToRemove != null) {
                V origVertex = edgeToRemove.getVOrig();
                V destVertex = edgeToRemove.getVDest();

                g.removeEdge(origVertex, destVertex);

                List<Set<V>> connectedComponents = getConnectedComponents(g);
                if (connectedComponents.size() > hubsAndClusters.size()) {
                    hubsAndClusters.clear();
                    for (Set<V> component : connectedComponents) {
                        V hub = findHubInCluster(g, component);
                        hubsAndClusters.put(hub, component);
                    }
                } else {
                    g.addEdge(origVertex, destVertex, edgeToRemove.getWeight());
                    visited.add(origVertex);
                    visited.add(destVertex);
                }
            } else {
                break;
            }
        }
    }

    private static <V, E> Edge<V, E> findEdgeWithMaxShortestPaths(Graph<V, E> g, Comparator<E> ce, BinaryOperator<E> sum, E zero, E infinity, Set<V> visited) {
        Edge<V, E> edgeWithMaxPaths = null;
        int maxPaths = 0;

        for (Edge<V, E> edge : g.edges()) {
            int numPaths = calculateShortestPaths(g, edge, ce, sum, zero, infinity);
            if (numPaths > maxPaths) {
                maxPaths = numPaths;
                edgeWithMaxPaths = edge;
            }
        }
        return edgeWithMaxPaths;
    }

    private static <V, E> List<Set<V>> getConnectedComponents(Graph<V, E> g) {
        List<Set<V>> connectedComponents = new ArrayList<>();
        Set<V> visitedVertices = new HashSet<>();

        for (V vertex : g.vertices()) {
            if (!visitedVertices.contains(vertex)) {
                Set<V> connectedComponent = depthFirstSearch(g, vertex);
                connectedComponents.add(connectedComponent);
                if (connectedComponent != null) {
                    visitedVertices.addAll(connectedComponent);
                }
            }
        }
        return connectedComponents;
    }

    private static <V, E> Set<V> depthFirstSearch(Graph<V, E> g, V vertex) {
        LinkedList<V> result = Algorithms.depthFirstSearch(g, vertex);
        return (result != null) ? new HashSet<>(result) : null;
    }

    private static <V, E> int calculateShortestPaths(Graph<V, E> g, Edge<V, E> edge, Comparator<E> ce, BinaryOperator<E> sum, E zero, E infinity) {
        V sourceVertex = edge.getVOrig();
        V targetVertex = edge.getVDest();

        ArrayList<LinkedList<V>> paths = new ArrayList<>();
        ArrayList<E> dists = new ArrayList<>();
        boolean success = Algorithms.shortestPaths(g, sourceVertex, ce, sum, zero, paths, dists, infinity);

        if (!success) {
            return 0;
        }

        int countPaths = 0;
        for (LinkedList<V> path : paths) {
            if (path.contains(sourceVertex) && path.contains(targetVertex)) {
                countPaths++;
            }
        }

        return countPaths;
    }

    private static <V, E> V findHubInCluster(Graph<V, E> g, Set<V> cluster) {
        if (g == null || cluster == null || cluster.isEmpty()) {
            return null;
        }
        return cluster.stream().max(Comparator.comparingInt(v -> g.inDegree(v) + g.outDegree(v))).orElse(null);
    }
}
