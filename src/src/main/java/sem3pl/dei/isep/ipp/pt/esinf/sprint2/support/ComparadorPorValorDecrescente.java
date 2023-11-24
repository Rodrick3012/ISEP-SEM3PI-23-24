package sem3pl.dei.isep.ipp.pt.esinf.sprint2.support;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;

import java.util.Comparator;
import java.util.Map;

public class ComparadorPorValorDecrescente<T extends Number> implements Comparator<Map.Entry<Locals, T>> {
    @Override
    public int compare(Map.Entry<Locals, T> entry1, Map.Entry<Locals, T> entry2) {
        // Using doubleValue() to compare both Integer and Double values
        return Double.compare(entry2.getValue().doubleValue(), entry1.getValue().doubleValue());
    }
}
