package sem3pl.dei.isep.ipp.pt.esinf.sprint2.support;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;

import java.util.Map;

public class desempatadorCriterios {
    public static void desempatarCriterios(Map<Locals, Double> mapaOrdenado, Map<Locals, Integer> mapaInfluencia, Map<Locals, Double> mapaProximidade, Map.Entry<Locals, Double> entryAtual, Map.Entry<Locals, Double> entryProximo) {
        double valorDesempateAtual = mapaInfluencia.get(entryAtual.getKey());
        double valorDesempateProximo = mapaInfluencia.get(entryProximo.getKey());

        if (valorDesempateAtual < valorDesempateProximo) {
            // Trocar as entradas no mapa ordenado
            mapaOrdenado.put(entryAtual.getKey(), entryProximo.getValue());
            mapaOrdenado.put(entryProximo.getKey(), entryAtual.getValue());
        } else if (valorDesempateAtual == valorDesempateProximo) {
            // Empate no 1º critério, aplicar critério de desempate do 2º critério
            desempatarCriterioProximidade(mapaOrdenado, mapaProximidade, entryAtual, entryProximo);
        }
    }

    private static void desempatarCriterioProximidade(Map<Locals, Double> mapaOrdenado, Map<Locals, Double> mapaProximidade, Map.Entry<Locals, Double> entryAtual, Map.Entry<Locals, Double> entryProximo) {
        double valorDesempateAtualCriterio2 = mapaProximidade.getOrDefault(entryAtual.getKey(), 0.0);
        double valorDesempateProximoCriterio2 = mapaProximidade.getOrDefault(entryProximo.getKey(), 0.0);

        if (valorDesempateAtualCriterio2 < valorDesempateProximoCriterio2) {
            // Trocar as entradas no mapa ordenado
            mapaOrdenado.put(entryAtual.getKey(), entryProximo.getValue());
            mapaOrdenado.put(entryProximo.getKey(), entryAtual.getValue());
        }
    }
}
