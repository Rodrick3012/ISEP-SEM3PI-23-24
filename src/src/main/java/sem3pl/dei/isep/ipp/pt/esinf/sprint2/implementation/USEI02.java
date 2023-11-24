package sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Algorithms;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.support.ComparadorPorValorDecrescente;

import java.util.*;

public class USEI02 {


    //1criterio

    public static Map<Locals, Integer> obterMapaOrdenadoPorGrau(CommonGraph<Locals,Integer> graph) {
        Map<Locals, Integer> grausMap = new HashMap<>();

        // Iterar sobre todos os vértices do grafo
        for (Locals vertex : graph.vertices()) {
            // Calcular o grau do vértice usando o método degreeOf que você implementou
            Integer grau = graph.degreeOf(vertex);

            // Se o grau não for null, adicionar ao mapa
            if (grau != null) {
                grausMap.put(vertex, grau);
            }
        }

        // Criar uma lista de entradas do mapa
        List<Map.Entry<Locals, Integer>> listaEntradas = new ArrayList<>(grausMap.entrySet());        // Ordenar a lista por ordem decrescente de valores usando um comparador externo

        Collections.sort(listaEntradas, new ComparadorPorValorDecrescente());

        // Criar um novo mapa ordenado
        Map<Locals, Integer> mapaOrdenado = new LinkedHashMap<>();
        for (Map.Entry<Locals, Integer> entry : listaEntradas) {
            mapaOrdenado.put(entry.getKey(), entry.getValue());
        }

        return mapaOrdenado;
    }




    //2criterio


    public Map<Locals, Double> calcularProximidade(CommonGraph<Locals,Double> graph) {
        Map<Locals, Double> proximidadeMap = new HashMap<>();

        for (Locals vertex : graph.vertices()) {
            double proximidade = calcularCentralidadeProximidade(vertex,graph);
            proximidadeMap.put(vertex, proximidade);
        }

        // Criar uma lista de entradas do mapa
        List<Map.Entry<Locals, Double>> listaEntradas = new ArrayList<>(proximidadeMap.entrySet());        // Ordenar a lista por ordem decrescente de valores usando um comparador externo

        Collections.sort(listaEntradas, new ComparadorPorValorDecrescente());


        // Criar um novo mapa ordenado
        Map<Locals, Double> mapaOrdenado = new LinkedHashMap<>();
        for (Map.Entry<Locals, Double> entry : listaEntradas) {
            mapaOrdenado.put(entry.getKey(), entry.getValue());
        }

        return proximidadeMap;
    }

    private double calcularCentralidadeProximidade(Locals sourceVertex,CommonGraph<Locals,Double> graph) {
        double somaDistancias = 0.0;
        Algorithms algorithms = new Algorithms();
        for (Locals targetVertex : graph.vertices()) {
            if (!sourceVertex.equals(targetVertex)) {
                // Calcular a distância mais curta entre os vértices usando Dijkstra
                LinkedList<Locals> shortPath = new LinkedList<>();

                double distancia = Algorithms.shortestPath(graph, sourceVertex, targetVertex, Comparator.naturalOrder(), Double::sum, 0.0, shortPath, Double.MAX_VALUE);                // Somar a distância invertida
                somaDistancias += 1.0 / distancia;
            }
        }

        return somaDistancias;
    }
}
