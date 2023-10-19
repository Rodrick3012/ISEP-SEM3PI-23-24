package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Objects;

public class Watering {
    private Character agriculturalParcelSector;
    private Integer wateringMinutes;
    private WateringTimeRegularity wateringTimeRegularity;

    public Watering(Character agriculturalParcelSector, Integer wateringMinutes, WateringTimeRegularity wateringTimeRegularity) {
        this.agriculturalParcelSector = agriculturalParcelSector;
        this.wateringMinutes = wateringMinutes;
        this.wateringTimeRegularity = wateringTimeRegularity;
    }

    public Character getAgriculturalParcelSector() {
        return agriculturalParcelSector;
    }

    public void setAgriculturalParcelSector(Character agriculturalParcelSector) {
        this.agriculturalParcelSector = agriculturalParcelSector;
    }

    public Integer getWateringMinutes() {
        return wateringMinutes;
    }

    public void setWateringMinutes(Integer wateringMinutes) {
        this.wateringMinutes = wateringMinutes;
    }

    public WateringTimeRegularity getWateringTimeRegularity() {
        return wateringTimeRegularity;
    }

    public void setWateringTimeRegularity(WateringTimeRegularity wateringTimeRegularity) {
        this.wateringTimeRegularity = wateringTimeRegularity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Watering watering = (Watering) o;
        return Objects.equals(agriculturalParcelSector, watering.agriculturalParcelSector) && Objects.equals(wateringMinutes, watering.wateringMinutes) && Objects.equals(wateringTimeRegularity, watering.wateringTimeRegularity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(agriculturalParcelSector, wateringMinutes, wateringTimeRegularity);
    }
}
