package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Objects;

public class Watering {
    private Integer sector;
    private Integer wateringMinutes;
    private WateringTimeRegularity wateringTimeRegularity;

    public Watering(Integer sector, Integer wateringMinutes, WateringTimeRegularity wateringTimeRegularity) {
        this.sector = sector;
        this.wateringMinutes = wateringMinutes;
        this.wateringTimeRegularity = wateringTimeRegularity;
    }

    public Integer getSector() {
        return sector;
    }

    public void setSector(Integer sector) {
        this.sector = sector;
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
        return Objects.equals(sector, watering.sector) && Objects.equals(wateringMinutes, watering.wateringMinutes) && Objects.equals(wateringTimeRegularity, watering.wateringTimeRegularity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(sector, wateringMinutes, wateringTimeRegularity);
    }

    public String toString(){
        return String.format("%c, %d, %s", sector, wateringMinutes, wateringTimeRegularity.toString());
    }
}
