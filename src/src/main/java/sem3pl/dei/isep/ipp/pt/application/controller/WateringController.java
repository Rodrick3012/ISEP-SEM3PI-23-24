package sem3pl.dei.isep.ipp.pt.application.controller;


import sem3pl.dei.isep.ipp.pt.domain.Watering;
import sem3pl.dei.isep.ipp.pt.domain.WateringPlan;
import sem3pl.dei.isep.ipp.pt.domain.WateringTimeRegularity;
import sem3pl.dei.isep.ipp.pt.repository.WateringPlanRepository;

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
            while (sc.hasNext(" ")) {
                String firstLine = sc.nextLine();
                String[] hours = firstLine.split(",");
                int i = 0;
                while (i < hours.length) {
                    wateringHours.add(hours[i]);
                    i++;
                }
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
        Map<Watering, List<Calendar>> wateringCalendar = new HashMap<>();
        for(Watering watering : wateringList){
            List<Calendar> tempCalendarList = new ArrayList<>();
            Calendar newCalendar = Calendar.getInstance();
            for(String wateringHour : wateringHours) {
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                try {
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
                            interval = 2;
                            newCalendar.add(Calendar.DATE, 1);
                            break;
                        case "3":
                            interval = 3;
                            break;
                    }
                    for (int i = 0; i < 30; i += interval) {
                        Calendar tempCalendar = (Calendar) newCalendar.clone();
                        tempCalendar.add(Calendar.DATE, i);
                        tempCalendar.set(Calendar.MINUTE, watering.getWateringMinutes());
                        tempCalendarList.add(tempCalendar);
                    }
                } catch (ParseException e) {
                    return false;
                }
            }
            wateringCalendar.put(watering, tempCalendarList);
        }
        return wateringPlanRepository.createWateringPlan(wateringHours, wateringList, wateringCalendar);
    }

    public Map<Character, Boolean> verifiesThatIsWatering(WateringPlan wateringPlan, Integer month, Integer day, Integer hour, Integer minute) {
        Map<Character, Boolean> sectoresAreWatering = new HashMap<>();
        for (Map.Entry<Watering, List<Calendar>> entry : wateringPlan.getWateringCalendar().entrySet()) {
            Watering watering = entry.getKey();
            List<Calendar> calendarList = entry.getValue();
            boolean verification = false;
            for (Calendar calendar : calendarList) {
                if (calendar.get(Calendar.MONTH) + 1 == month && calendar.get(Calendar.DATE) == day &&
                        calendar.get(Calendar.HOUR_OF_DAY) == hour && calendar.get(Calendar.MINUTE) == minute) {
                    verification = true;
                    break;
                }
            }
            sectoresAreWatering.put(watering.getAgriculturalParcelSector(), verification);
        }
        return sectoresAreWatering;
    }

    public List<WateringPlan> getWateringPlanList() {
        return wateringPlanRepository.getWateringPlanList();
    }
}
