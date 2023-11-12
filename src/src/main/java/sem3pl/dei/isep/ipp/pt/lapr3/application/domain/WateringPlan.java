package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.text.SimpleDateFormat;
import java.util.*;

public class WateringPlan {
    private static Integer wateringPlanId = 0;
    private final List<String> wateringHours;
    private final List<Watering> wateringList;
    private final Map<Watering, List<DateInterval>> wateringCalendar;

    public WateringPlan(List<String> wateringHours, List<Watering> wateringList, Map<Watering, List<DateInterval>> wateringCalendar) {
        this.wateringHours = wateringHours;
        this.wateringList = wateringList;
        this.wateringCalendar = wateringCalendar;
        wateringPlanId++;
    }

    public List<String> getWateringHours() {
        return wateringHours;
    }

    public List<Watering> getWateringList() {
        return wateringList;
    }

    public Map<Watering, List<DateInterval>> getWateringCalendar() {
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

    public String toString(){
        return String.format("Watering Plan nº%d", wateringPlanId);
    }
}
