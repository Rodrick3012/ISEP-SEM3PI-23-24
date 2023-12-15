package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Algorithms;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;

import java.util.*;
import java.util.function.BinaryOperator;


public class USEI09 {
    public Map<Locals, Set<Locals>> organizeClusters(CommonGraph<Locals, Integer> g, Integer nClusters, ArrayList<LocationCriteria> hubs){
        Map<Locals, Set<Locals>> hubsAndClusters = new HashMap<>();
        ArrayList<LinkedList<Locals>> paths = new ArrayList<>();
        ArrayList<Integer> dists = new ArrayList<>();
        if(g != null){
            organizeClusters(g, hubsAndClusters, Integer::compare, Integer::sum, 0, paths, dists, Integer.MAX_VALUE, nClusters, hubs);
        }
        return hubsAndClusters;
    }

    private static <V,E> void organizeClusters(CommonGraph<V, E> g, Map<V, Set<V>> hubsAndClusters, Comparator<E> ce, BinaryOperator<E> sum, E zero, ArrayList<LinkedList<V>> paths, ArrayList<E> dists, E infinity, Integer nClusters, ArrayList<LocationCriteria> hubs){
        while(g.numEdges() > 0 && hubsAndClusters.size() < nClusters){
            Edge<V,E> edgeToRemove = findEdgeWithMaxShortestPaths(g, ce, sum, zero, paths, dists, infinity);
            g.removeEdge(edgeToRemove.getVOrig(), edgeToRemove.getVDest());

            List<Set<V>> connectedComponents = getConnectedComponents(g);
            for(Set<V> component : connectedComponents){
                V hub = findHubInCluster(component, hubs);
                hubsAndClusters.put(hub, component);
            }
        }
    }

    private static <V,E> Edge<V,E> findEdgeWithMaxShortestPaths(CommonGraph<V,E> g, Comparator<E> ce, BinaryOperator<E> sum, E zero, ArrayList<LinkedList<V>> paths, ArrayList<E> dists, E infinity){

        Edge<V,E> edgeWithMaxPaths = null;
        int maxPaths = 0;

        for(Edge<V,E> edge : g.edges()){
            int numPaths = calculateShortestPaths(g, edge, ce, sum, zero, paths, dists, infinity);
            if(numPaths > maxPaths){
                maxPaths = numPaths;
                edgeWithMaxPaths = edge;
            }
        }
        return edgeWithMaxPaths;
    }

    private static  <V,E> List<Set<V>> getConnectedComponents(CommonGraph<V,E> g){
        List<Set<V>> connectedComponents = new ArrayList<>();
        Set<V> visitedVertices = new HashSet<>();

        for (V vertex : g.vertices()){
            if(!visitedVertices.contains(vertex)){
                Set<V> connectedComponent = depthFirstSearch(g, vertex);
                connectedComponents.add(connectedComponent);
                visitedVertices.addAll(connectedComponent);
            }
        }
        return connectedComponents;
    }

    private static <V,E> Set<V> depthFirstSearch(CommonGraph<V,E> g, V vertex){
        LinkedList<V> result = Algorithms.depthFirstSearch(g, vertex);
        if(result != null) {
            return new HashSet<>(result);
        } else return new HashSet<>();
    }


    private static <V,E> int calculateShortestPaths(CommonGraph<V, E> g, Edge<V, E> edge, Comparator<E> ce, BinaryOperator<E> sum, E zero, ArrayList<LinkedList<V>> paths, ArrayList<E> dists, E infinity) {
        V sourceVertex = edge.getVOrig();
        V targetVertex = edge.getVDest();

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

    private <V,E> V chooseVertexByInfluence(Set<V> cluster, CommonGraph<V,E> g){
        HashMap<V, Integer> influenceMap = calculateInfluence(g, cluster);
        return Collections.max(cluster, Comparator.comparing(influenceMap::get));
    }

    private static <V,E> HashMap<V, Integer> calculateInfluence(CommonGraph<V, E> g, Set<V> vertices) {
        HashMap<V, Integer> influenceMap = new HashMap<>();

        for (V vertex : vertices) {
            int inDegree = g.inDegree(vertex);
            int outDegree = g.outDegree(vertex);
            influenceMap.put(vertex, inDegree + outDegree);
        }

        return influenceMap;
    }

    @SuppressWarnings("unchecked")
    private static <V,E> V findHubInCluster(Set<V> cluster, ArrayList<LocationCriteria> hubs) {
        V selectedHub = null;

        for(LocationCriteria criteria : hubs){
            V hub = (V) criteria.getLocation();

            if(cluster.contains(hub)){
                if(selectedHub == null){
                    selectedHub = hub;
                } else return null;
            }
        }

        return selectedHub;
    }
}
