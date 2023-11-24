package sem3pl.dei.isep.ipp.pt.esinf.sprint2.support;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;

import java.util.Comparator;
import java.util.Map;

public class ComparadorPorValorDecrescente implements Comparator<Map.Entry<Locals, Integer>> {
        @Override
        public int compare(Map.Entry<Locals, Integer> entry1, Map.Entry<Locals, Integer> entry2) {
            return entry2.getValue().compareTo(entry1.getValue());
        }
    }
