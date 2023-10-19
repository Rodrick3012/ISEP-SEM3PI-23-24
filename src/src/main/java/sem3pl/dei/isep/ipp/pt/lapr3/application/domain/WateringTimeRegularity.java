package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Objects;

public class WateringTimeRegularity {
    private String wateringRegularity;

    public WateringTimeRegularity(String wateringRegularity) {
        this.wateringRegularity = wateringRegularity;
    }

    public String getWateringRegularity() {
        return wateringRegularity;
    }

    public void setWateringRegularity(String wateringRegularity) {
        this.wateringRegularity = wateringRegularity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WateringTimeRegularity that = (WateringTimeRegularity) o;
        return Objects.equals(wateringRegularity, that.wateringRegularity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(wateringRegularity);
    }

    public String toString(){
        return String.format("%s", wateringRegularity);
    }
}
