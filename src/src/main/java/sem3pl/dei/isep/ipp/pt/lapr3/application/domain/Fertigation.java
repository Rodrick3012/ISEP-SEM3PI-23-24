package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Objects;

public class Fertigation {
    private Integer mix;
    private Integer recurrence;

    public Fertigation(Integer mix, Integer recurrence) {
        this.mix = mix;
        this.recurrence = recurrence;
    }

    public Integer getMix() {
        return mix;
    }

    public void setMix(Integer mix) {
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
