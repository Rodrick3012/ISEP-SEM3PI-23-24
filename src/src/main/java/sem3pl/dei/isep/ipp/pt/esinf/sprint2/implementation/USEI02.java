package sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.support.ComparadorPorGrauDecrescente;

import java.util.*;

public class USEI02 {

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

        Collections.sort(listaEntradas, new ComparadorPorGrauDecrescente());

        // Criar um novo mapa ordenado
        Map<Locals, Integer> mapaOrdenado = new LinkedHashMap<>();
        for (Map.Entry<Locals, Integer> entry : listaEntradas) {
            mapaOrdenado.put(entry.getKey(), entry.getValue());
        }

        return mapaOrdenado;
    }
}
