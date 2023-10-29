package sem3pi.dei.isep.ipp.pt.lap3.application.repository;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.DateInterval;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Watering;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringPlan;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringTimeRegularity;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.WateringPlanRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.WateringComparator;

import java.util.*;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class WateringPlanRepositoryTest {
    @Test
    public void assertWateringPlanRepositoryIsEmptyIfNotAddedInTheList(){
        WateringPlanRepository wateringPlanRepository = new WateringPlanRepository();
        assertTrue(wateringPlanRepository.getWateringPlanList().isEmpty());
    }

    @Test
    public void assertWateringPlanIsCreatedSuccessfully(){
        WateringPlanRepository wateringPlanRepository = new WateringPlanRepository();
        String wateringHour1 = "08:30";
        String wateringHour2 = "17:00";
        List<String> wateringHours = new ArrayList<>(Arrays.asList(wateringHour1, wateringHour2));
        Watering watering1 = new Watering('A', 10, new WateringTimeRegularity("T"));
        Watering watering2 = new Watering('B', 50, new WateringTimeRegularity("3"));
        List<Watering> wateringList = new ArrayList<>(Arrays.asList(watering1, watering2));
        Calendar calendar1 = Calendar.getInstance();
        calendar1.set(2023, 10, 10);
        Date date1 = calendar1.getTime();
        calendar1.set(2023, 12, 12);
        Date date2 = calendar1.getTime();
        DateInterval dateInterval1 = new DateInterval(date1, date2);
        calendar1.set(2023, 10, 9);
        Date date3 = calendar1.getTime();
        calendar1.set(2024, 3, 3);
        Date date4 = calendar1.getTime();
        DateInterval dateInterval2 = new DateInterval(date3, date4);
        List<DateInterval> dateIntervals1 = new ArrayList<>(Arrays.asList(dateInterval1, dateInterval2));
        calendar1.set(2022, 10, 10);
        Date date5 = calendar1.getTime();
        calendar1.set(2022, 12, 12);
        Date date6 = calendar1.getTime();
        DateInterval dateInterval3 = new DateInterval(date5, date6);
        calendar1.set(2022, 10, 9);
        Date date7 = calendar1.getTime();
        calendar1.set(2023, 3, 3);
        Date date8 = calendar1.getTime();
        DateInterval dateInterval4 = new DateInterval(date7, date8);
        List<DateInterval> dateIntervals2 = new ArrayList<>(Arrays.asList(dateInterval3, dateInterval4));
        Map<Watering, List<DateInterval>> wateringCalendar = new TreeMap<>(new WateringComparator());
        wateringCalendar.put(watering1, dateIntervals1);
        wateringCalendar.put(watering2, dateIntervals2);
        assertTrue(wateringPlanRepository.createWateringPlan(wateringHours, wateringList, wateringCalendar));
    }
}
