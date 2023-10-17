package sem3pl.dei.isep.ipp.pt.domain;

import java.util.*;

public class WateringPlan {
    private final List<String> wateringHours;
    private final List<Watering> wateringList;
    private final Map<Watering, List<Calendar>> wateringCalendar;

    public WateringPlan(List<String> wateringHours, List<Watering> wateringList, Map<Watering, List<Calendar>> wateringCalendar) {
        this.wateringHours = wateringHours;
        this.wateringList = wateringList;
        this.wateringCalendar = wateringCalendar;
    }

    public List<String> getWateringHours() {
        return wateringHours;
    }

    public List<Watering> getWateringList() {
        return wateringList;
    }

    public Map<Watering, List<Calendar>> getWateringCalendar() {
        return wateringCalendar;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WateringPlan that = (WateringPlan) o;
        return Objects.equals(wateringHours, that.wateringHours) && Objects.equals(wateringList, that.wateringList) && Objects.equals(wateringCalendar, that.wateringCalendar);
    }

    @Override
    public int hashCode() {
        return Objects.hash(wateringHours, wateringList, wateringCalendar);
    }
}
