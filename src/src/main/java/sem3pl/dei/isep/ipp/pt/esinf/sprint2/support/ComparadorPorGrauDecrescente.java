package sem3pl.dei.isep.ipp.pt.esinf.sprint2.support;

import java.util.Comparator;
import java.util.Map;

public class ComparadorPorGrauDecrescente implements Comparator<Map.Entry<String, Integer>> {
        @Override
        public int compare(Map.Entry<String, Integer> entry1, Map.Entry<String, Integer> entry2) {
            return entry2.getValue().compareTo(entry1.getValue());
        }
    }
