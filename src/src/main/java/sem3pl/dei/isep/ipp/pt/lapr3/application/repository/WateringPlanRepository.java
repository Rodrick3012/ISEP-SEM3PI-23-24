package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.DateInterval;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Watering;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringPlan;

import java.util.*;

public class WateringPlanRepository {
    private final List<WateringPlan> wateringPlanList = new ArrayList<>();

    public WateringPlanRepository() {
    }


    public List<WateringPlan> getWateringPlanList() {
        return wateringPlanList;
    }

    public boolean createWateringPlan(List<String> wateringHours, List<Watering>  wateringList, Map<Watering, List<DateInterval>> wateringCalendar){
        WateringPlan wateringPlan = new WateringPlan(wateringHours, wateringList, wateringCalendar);
        if(!hasDuplicate(wateringPlanList)){
            return addWateringPlan(wateringPlan);
        } else return false;
    }

    private boolean addWateringPlan(WateringPlan wateringPlan){
        return wateringPlanList.add(wateringPlan);
    }

    private static boolean hasDuplicate(List<WateringPlan> wateringPlanList){
        Iterator<WateringPlan> wateringPlanIterator = wateringPlanList.iterator();
        while(wateringPlanIterator.hasNext()){
            WateringPlan wateringPlan = wateringPlanIterator.next();
            wateringPlanIterator.remove();
            if(wateringPlanList.contains(wateringPlan)){
                return true;
            }
        }
        return false;
    }
}
