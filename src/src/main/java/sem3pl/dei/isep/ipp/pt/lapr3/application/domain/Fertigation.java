package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Objects;

public class Fertigation {
    private String mix;
    private Integer recurrence;

    public Fertigation(String mix, Integer recurrence) {
        this.mix = mix;
        this.recurrence = recurrence;
    }

    public String getMix() {
        return mix;
    }

    public void setMix(String mix) {
        this.mix = mix;
    }

    public Integer getRecurrence() {
        return recurrence;
    }

    public void setRecurrence(Integer recurrence) {
        this.recurrence = recurrence;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Fertigation that = (Fertigation) o;
        return Objects.equals(mix, that.mix) && Objects.equals(recurrence, that.recurrence);
    }

    @Override
    public int hashCode() {
        return Objects.hash(mix, recurrence);
    }
}
