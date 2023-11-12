package sem3pl.dei.isep.ipp.pt.lapr3.application.controller;


import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.*;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.WateringPlanRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Files;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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

    private boolean createWateringPlan(List<String> wateringHours, List<Watering> wateringList) {
        Map<Watering, List<DateInterval>> wateringCalendar = new HashMap<>();
        int actualMinutesWatering = 0;
        for (Watering watering : wateringList) {
            List<DateInterval> dateIntervalList = new ArrayList<>();
            Calendar newCalendar = Calendar.getInstance();
            for (String wateringHour : wateringHours) {
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                try {
                    Date date = sdf.parse(wateringHour);
                    newCalendar.setTime(date);
                    if(actualMinutesWatering != 0){
                        int hoursToAdd = actualMinutesWatering / 60;
                        int minutesToAdd = actualMinutesWatering % 60;
                        newCalendar.add(Calendar.HOUR_OF_DAY, hoursToAdd);
                        newCalendar.add(Calendar.MINUTE, minutesToAdd);
                    }
                    int interval = 1;
                    switch (String.valueOf(watering.getWateringTimeRegularity())) {
                        case "T":
                        case "P":
                        case "I":
                            break;
                        case "3":
                            interval = 3;
                            break;
                    }
                    for (int i = 0; i < 30; i += interval) {
                        Calendar tempCalendar = (Calendar) newCalendar.clone();
                        tempCalendar.set(Calendar.MONTH, LocalDate.now().getMonthValue()-1);
                        tempCalendar.set(Calendar.DAY_OF_MONTH, LocalDate.now().getDayOfMonth());
                        tempCalendar.set(Calendar.YEAR, LocalDate.now().getYear());
                        if (String.valueOf(watering.getWateringTimeRegularity()).equals("I")) {
                            if (tempCalendar.get(Calendar.DAY_OF_MONTH) % 2 != 0) {
                                continue;
                            }
                        } else {
                            if (String.valueOf(watering.getWateringTimeRegularity()).equals("P")) {
                                if (tempCalendar.get(Calendar.DAY_OF_MONTH) % 2 == 0) {
                                    continue;
                                }
                            }
                        }
                            int daysInMonth = tempCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
                            tempCalendar.add(Calendar.DATE, i);
                            if (tempCalendar.get(Calendar.DATE) > daysInMonth) {
                                tempCalendar.add(Calendar.MONTH, 1);
                            }
                            Date startDate = tempCalendar.getTime();
                            tempCalendar.add(Calendar.MINUTE, watering.getWateringMinutes());
                            Date endDate = tempCalendar.getTime();
                            DateInterval dateInterval = new DateInterval(startDate, endDate);
                            dateIntervalList.add(dateInterval);
                    }
                } catch (ParseException e) {
                    return false;
                }
            }
            actualMinutesWatering += watering.getWateringMinutes();
            wateringCalendar.put(watering, dateIntervalList);
        }
        return wateringPlanRepository.createWateringPlan(wateringHours, wateringList, wateringCalendar);
    }

    public Map<Character, Integer> verifiesThatIsWatering(WateringPlan wateringPlan, Integer year, Integer month, Integer day, Integer hour, Integer minute) {
        Map<Character, Integer> sectorsAreWatering = new HashMap<>();
        Calendar cal = Calendar.getInstance();
        cal.clear();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month-1);
        cal.set(Calendar.DATE, day);
        cal.set(Calendar.HOUR, hour);
        cal.set(Calendar.MINUTE, minute);
        Date date = cal.getTime();
        for (Map.Entry<Watering, List<DateInterval>> entry : wateringPlan.getWateringCalendar().entrySet()) {
            Watering watering = entry.getKey();
            List<DateInterval> calendarList = entry.getValue();
            for (DateInterval dateInterval : calendarList) {
                if (date.after(dateInterval.getStartDate()) && date.before(dateInterval.getEndDate())) {
                    Calendar cal1 = Calendar.getInstance();
                    cal1.clear();
                    cal1.setTime(dateInterval.getEndDate());
                    int differenceMinutes = cal1.get(Calendar.MINUTE) - minute;
                    sectorsAreWatering.put(watering.getAgriculturalParcelSector(), differenceMinutes);
                    break;
                }
            }
        }
        return sectorsAreWatering;
    }

    public String generateWateringPlan(WateringPlan wateringPlan) {
        String fileName = "wateringPlan.csv";
        Map<Watering, List<DateInterval>> wateringCalendar = wateringPlan.getWateringCalendar();
        try {
            PrintWriter pw = new PrintWriter(Files.resourcesPath + fileName);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            List<DateInterval> allDateIntervals = new ArrayList<>();

            for(List<DateInterval> intervals : wateringCalendar.values()){
                allDateIntervals.addAll(intervals);
            }
            allDateIntervals.sort(Comparator.comparing(DateInterval::getStartDate));
            pw.println("Dia;Sector;Duração;Inicio;Final");

            Calendar currentDate = Calendar.getInstance();
            currentDate.setTime(new Date());
            currentDate.set(Calendar.HOUR_OF_DAY, 0);
            currentDate.set(Calendar.MINUTE, 0);
            currentDate.set(Calendar.SECOND, 0);
            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(currentDate.getTime());
            endCalendar.add(Calendar.DAY_OF_MONTH, 31);

            System.out.println(currentDate.getTime());
            System.out.println(endCalendar.getTime());

            for (DateInterval dateInterval : allDateIntervals) {
                Calendar cal1 = Calendar.getInstance();
                cal1.clear();
                cal1.setTime(dateInterval.getStartDate());
                System.out.println(cal1.getTime());
                if (cal1.after(currentDate) && cal1.before(endCalendar)) {
                    Watering watering = findWateringForDateInterval(wateringCalendar, dateInterval);
                    if(watering != null) {
                        Date startDate = dateInterval.getStartDate();
                        Date endDate = dateInterval.getEndDate();
                        pw.println(dateFormat.format(startDate) + ";" +
                                    watering.getAgriculturalParcelSector() + ";" +
                                    watering.getWateringMinutes() + ";" +
                                    timeFormat.format(startDate) + ";" +
                                    timeFormat.format(endDate));
                    }
                }
            }
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
    }

    private Watering findWateringForDateInterval(Map<Watering, List<DateInterval>> wateringCalendar, DateInterval dateInterval) {
        for (Map.Entry<Watering, List<DateInterval>> entry : wateringCalendar.entrySet()) {
            if (entry.getValue().contains(dateInterval)) {
                return entry.getKey();
            }
        }
        return null;
    }

    public boolean readWateringPlanGeneratedFileAndCheckIfWateringConcluded(String fileName){
        fileName = Files.resourcesPath + fileName;
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.set(Calendar.YEAR, LocalDate.now().getYear());
        currentCalendar.set(Calendar.MONTH, LocalDate.now().getMonthValue());
        currentCalendar.set(Calendar.DAY_OF_MONTH, LocalDate.now().getDayOfMonth());
        currentCalendar.setTimeInMillis(System.currentTimeMillis());
        try{
            Scanner sc = new Scanner(new File(fileName));
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            sc.nextLine();
            while(sc.hasNextLine()){
                Calendar calendar = Calendar.getInstance();
                String line = sc.nextLine();
                String[] wateringPlanData = line.split(";");
                Date date = dateFormat.parse(wateringPlanData[0]);
                calendar.setTime(date);
                Date time = timeFormat.parse(wateringPlanData[4]);
                Calendar timeCalendar = Calendar.getInstance();
                timeCalendar.setTime(time);
                calendar.set(Calendar.HOUR_OF_DAY, timeCalendar.get(Calendar.HOUR_OF_DAY));
                calendar.set(Calendar.MINUTE, timeCalendar.get(Calendar.MINUTE));
                if(currentCalendar.getTime().after(calendar.getTime())){
                    String wateringSector = wateringPlanData[1];
                    System.out.println(wateringPlanData[1] + ", " +  wateringPlanData[4]);
                    // inserir a rega concluida na base de dados
                }
            }
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }


    public List<WateringPlan> getWateringPlanList() {
        return wateringPlanRepository.getWateringPlanList();
    }
}
