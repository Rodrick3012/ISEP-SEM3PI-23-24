package sem3pl.dei.isep.ipp.pt.lapr3.application.controller;


import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.DateInterval;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Watering;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringPlan;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringTimeRegularity;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.WateringPlanRepository;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class WateringController {
    private final WateringPlanRepository wateringPlanRepository = new WateringPlanRepository();

    public WateringController() {
    }

    public boolean readFile(String fileName) {
        List<String> wateringHours = new ArrayList<>();
        List<Watering> wateringList = new ArrayList<>();
        try {
            Scanner sc = new Scanner(new File(fileName));
            String firstLine = sc.nextLine();
            String[] hours = firstLine.split(", ");
            int i = 0;
            while (i < hours.length) {
                    wateringHours.add(hours[i]);
                    i++;
            }
            while (sc.hasNextLine()) {
                String nextLine = sc.nextLine();
                String[] wateringData = nextLine.split(",");
                Watering watering = new Watering(wateringData[0].charAt(0), Integer.valueOf(wateringData[1]), new WateringTimeRegularity(wateringData[2]));
                wateringList.add(watering);
            }
            return createWateringPlan(wateringHours, wateringList);
        } catch (IOException e) {
            return false;
        }
    }

    private boolean createWateringPlan(List<String> wateringHours, List<Watering> wateringList){
        Map<Watering, List<DateInterval>> wateringCalendar = new HashMap<>();
        for(Watering watering : wateringList){
            List<DateInterval> dateIntervalList = new ArrayList<>();
            Calendar newCalendar = Calendar.getInstance();
            for(String wateringHour : wateringHours) {
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                try {
                    newCalendar.setTime(new Date());
                    Date date = sdf.parse(wateringHour);
                    newCalendar.setTime(date);
                    int interval = 1;
                    switch (String.valueOf(watering.getWateringTimeRegularity())) {
                        case "T":
                            break;
                        case "P":
                            interval = 2;
                            break;
                        case "I":
                            newCalendar.add(Calendar.DATE, 1);
                            break;
                        case "3":
                            interval = 3;
                            break;
                    }
                    for (int i = 0; i < 30; i += interval) {
                        if(String.valueOf(watering.getWateringTimeRegularity()).equals("I") && i % 2 == 0){
                            continue;
                        }
                        if(String.valueOf(watering.getWateringTimeRegularity()).equals("P") && i % 2 != 0){
                            continue;
                        }
                        if(String.valueOf(watering.getWateringTimeRegularity()).equals("3") && i % 3 != 0) {
                            continue;
                        }
                        Calendar tempCalendar = (Calendar) newCalendar.clone();
                        Date startDate = tempCalendar.getTime();
                        tempCalendar.add(Calendar.DATE, i);
                        tempCalendar.add(Calendar.MINUTE, watering.getWateringMinutes());
                        Date endDate = tempCalendar.getTime();
                        DateInterval dateInterval = new DateInterval(startDate, endDate);
                        dateIntervalList.add(dateInterval);
                    }
                } catch (ParseException e) {
                    return false;
                }
            }
            wateringCalendar.put(watering, dateIntervalList);
        }
        return wateringPlanRepository.createWateringPlan(wateringHours, wateringList, wateringCalendar);
    }

    public Map<Character, Boolean> verifiesThatIsWatering(WateringPlan wateringPlan, Integer month, Integer day, Integer hour, Integer minute) {
        Map<Character, Boolean> sectorsAreWatering = new HashMap<>();
        Calendar cal = Calendar.getInstance();
        cal.clear();
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DATE, day);
        cal.set(Calendar.HOUR, hour);
        cal.set(Calendar.MINUTE, minute);
        Date date = cal.getTime();
        for (Map.Entry<Watering, List<DateInterval>> entry : wateringPlan.getWateringCalendar().entrySet()) {
            Watering watering = entry.getKey();
            List<DateInterval> calendarList = entry.getValue();
            boolean verification = false;
            for (DateInterval dateInterval : calendarList) {
                if (dateInterval.getStartDate().after(date) && dateInterval.getEndDate().before(date)) {
                    verification = true;
                    break;
                }
            }
            sectorsAreWatering.put(watering.getAgriculturalParcelSector(), verification);
        }
        return sectorsAreWatering;
    }

    public List<WateringPlan> getWateringPlanList() {
        return wateringPlanRepository.getWateringPlanList();
    }
}
