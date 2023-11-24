package sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.support.ComparadorPorGrauDecrescente;

import java.util.*;

public class USEI02 {

    public static Map<String, Integer> obterMapaOrdenadoPorGrau(Graph<String, DefaultEdge> graph) {
        Map<String, Integer> grausMap = new HashMap<>();

        // Iterar sobre todos os vértices do grafo
        for (String vertex : graph.vertices()) {
            // Calcular o grau do vértice usando o método degreeOf que você implementou
            Integer grau = graph.degreeOf(vertex);

            // Se o grau não for null, adicionar ao mapa
            if (grau != null) {
                grausMap.put(vertex, grau);
            }
        }

        // Criar uma lista de entradas do mapa
        List<Map.Entry<String, Integer>> listaEntradas = new ArrayList<>(grausMap.entrySet());

        // Ordenar a lista por ordem decrescente de valores usando um comparador externo
        Collections.sort(listaEntradas, new ComparadorPorGrauDecrescente());

        // Criar um novo mapa ordenado
        Map<String, Integer> mapaOrdenado = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> entry : listaEntradas) {
            mapaOrdenado.put(entry.getKey(), entry.getValue());
        }

        return mapaOrdenado;
    }
}
