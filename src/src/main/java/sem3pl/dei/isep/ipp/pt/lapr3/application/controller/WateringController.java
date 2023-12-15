package sem3pl.dei.isep.ipp.pt.lapr3.application.controller;


import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.*;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.WateringPlanRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Files;

import java.io.File;
import java.io.FileWriter;
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

    public WateringPlan readFile(String fileName) {
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
                Watering watering = new Watering(Integer.valueOf(wateringData[0]), Integer.valueOf(wateringData[1]), new WateringTimeRegularity(wateringData[2]), null);
                if(wateringData.length > 3){
                    String mixNumber = wateringData[3].replaceAll("[^0-9]", "");
                    Fertigation fertigation = new Fertigation(Integer.parseInt(mixNumber), Integer.parseInt(wateringData[4]));
                    watering.setFertigation(fertigation);
                }
                wateringList.add(watering);
            }
        } catch (IOException e) {
            return null;
        }
        return createWateringPlan(wateringHours, wateringList);
    }

    private WateringPlan createWateringPlan(List<String> wateringHours, List<Watering> wateringList) {
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
                    if(watering.getFertigation() != null) {
                        int fertigationRecurrence = watering.getFertigation().getRecurrence();
                        for (int j = 0; j < 30; j += fertigationRecurrence) {
                            Calendar tempCalendar1 = (Calendar) newCalendar.clone();
                            tempCalendar1.set(Calendar.MONTH, LocalDate.now().getMonthValue()-1);
                            tempCalendar1.set(Calendar.DAY_OF_MONTH, LocalDate.now().getDayOfMonth());
                            tempCalendar1.set(Calendar.YEAR, LocalDate.now().getYear());
                            int daysInMonth = tempCalendar1.getActualMaximum(Calendar.DAY_OF_MONTH);
                            tempCalendar1.add(Calendar.DATE, j);
                            if (tempCalendar1.get(Calendar.DATE) > daysInMonth) {
                                tempCalendar1.add(Calendar.MONTH, 1);
                            }
                            for(DateInterval dateInterval : dateIntervalList){
                                Date date1 = dateInterval.getStartDate();
                                Calendar testCalendar = Calendar.getInstance();
                                testCalendar.clear();
                                testCalendar.setTime(date1);
                                if(tempCalendar1.get(Calendar.YEAR) == testCalendar.get(Calendar.YEAR) &&
                                        tempCalendar1.get(Calendar.MONTH) == testCalendar.get(Calendar.MONTH) &&
                                tempCalendar1.get(Calendar.DAY_OF_MONTH) == testCalendar.get(Calendar.DAY_OF_MONTH) ){
                                    dateInterval.setFertigationMix(watering.getFertigation().getMix());
                                }
                            }
                        }
                    }
                } catch (ParseException e) {
                    return null;
                }
            }
            actualMinutesWatering += watering.getWateringMinutes();
            wateringCalendar.put(watering, dateIntervalList);
        }
        return wateringPlanRepository.createWateringPlan(wateringHours, wateringList, wateringCalendar);
    }

    public Map<Integer, Integer> verifiesThatIsWatering(WateringPlan wateringPlan, Integer year, Integer month, Integer day, Integer hour, Integer minute) {
        Map<Integer, Integer> sectorsAreWatering = new HashMap<>();
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
                    sectorsAreWatering.put(watering.getSector(), differenceMinutes);
                    break;
                }
            }
        }
        return sectorsAreWatering;
    }

    public String generateWateringPlan(WateringPlan wateringPlan) {
        String fileName = "wateringPlan.csv";
        Map<Watering, List<DateInterval>> wateringCalendar = wateringPlan.getWateringCalendar();
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.set(Calendar.YEAR, LocalDate.now().getYear());
        currentCalendar.set(Calendar.MONTH, LocalDate.now().getMonthValue());
        currentCalendar.set(Calendar.DAY_OF_MONTH, LocalDate.now().getDayOfMonth());
        currentCalendar.setTimeInMillis(System.currentTimeMillis());
        try {
            PrintWriter pw = new PrintWriter(Files.resourcesPath + fileName);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            List<DateInterval> allDateIntervals = new ArrayList<>();

            for(List<DateInterval> intervals : wateringCalendar.values()){
                allDateIntervals.addAll(intervals);
            }
            allDateIntervals.sort(Comparator.comparing(DateInterval::getStartDate));
            pw.println("Dia;Sector;Duração;Inicio;Final;Mix de fertirrega;Concluída");

            Calendar currentDate = Calendar.getInstance();
            currentDate.setTime(new Date());
            currentDate.set(Calendar.HOUR_OF_DAY, 0);
            currentDate.set(Calendar.MINUTE, 0);
            currentDate.set(Calendar.SECOND, 0);
            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(currentDate.getTime());
            endCalendar.add(Calendar.DAY_OF_MONTH, 31);

            for (DateInterval dateInterval : allDateIntervals) {
                Calendar cal1 = Calendar.getInstance();
                cal1.clear();
                cal1.setTime(dateInterval.getStartDate());
                if (cal1.after(currentDate) && cal1.before(endCalendar)) {
                    Watering watering = findWateringForDateInterval(wateringCalendar, dateInterval);
                    if(watering != null) {
                        Date startDate = dateInterval.getStartDate();
                        Date endDate = dateInterval.getEndDate();
                        if (dateInterval.getFertigationMix() == null) {
                            if (endDate.before(currentCalendar.getTime()))
                                pw.println(dateFormat.format(startDate) + ";" +
                                        watering.getSector() + ";" +
                                        watering.getWateringMinutes() + ";" +
                                        timeFormat.format(startDate) + ";" +
                                        timeFormat.format(endDate) + ";" + ";" + "Sim");
                            else pw.println(dateFormat.format(startDate) + ";" +
                                    watering.getSector() + ";" +
                                    watering.getWateringMinutes() + ";" +
                                    timeFormat.format(startDate) + ";" +
                                    timeFormat.format(endDate) + ";" + ";" + "Não");
                        } else if (endDate.before(currentCalendar.getTime()))
                            pw.println(dateFormat.format(startDate) + ";" +
                                    watering.getSector() + ";" +
                                    watering.getWateringMinutes() + ";" +
                                    timeFormat.format(startDate) + ";" +
                                    timeFormat.format(endDate) + ";" +
                                    dateInterval.getFertigationMix() + ";" +
                                    "Sim");
                        else pw.println(dateFormat.format(startDate) + ";" +
                                    watering.getSector() + ";" +
                                    watering.getWateringMinutes() + ";" +
                                    timeFormat.format(startDate) + ";" +
                                    timeFormat.format(endDate) + ";" +
                                    dateInterval.getFertigationMix() + ";" +
                                    "Não");
                    }
                }
            }
            pw.close();
        } catch (IOException e) {
            return null;
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
        Calendar currentCalendar = Calendar.getInstance();
        currentCalendar.set(Calendar.YEAR, LocalDate.now().getYear());
        currentCalendar.set(Calendar.MONTH, LocalDate.now().getMonthValue());
        currentCalendar.set(Calendar.DAY_OF_MONTH, LocalDate.now().getDayOfMonth());
        currentCalendar.setTimeInMillis(System.currentTimeMillis());
        try{
            Scanner sc = new Scanner(new File(Files.resourcesPath + fileName));
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
                boolean isWateringConcluded = "Sim".equals(wateringPlanData[5]);
                if(isWateringConcluded && currentCalendar.getTime().after(calendar.getTime())) {
                    Integer wateringSector = Integer.parseInt(wateringPlanData[1]);
                    Integer wateringDuration = Integer.parseInt(wateringPlanData[2]);
                    SimpleDateFormat inputDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    Date dateWateringConcluded = inputDateFormat.parse(wateringPlanData[0]);
                    SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    outputDateFormat.format(dateWateringConcluded);
                    String wateringInitialTime = wateringPlanData[3];
                    String fertigationMix = wateringPlanData[5];
                    if(fertigationMix.isEmpty()) {
                        wateringPlanRepository.wateringOperationRegister(wateringSector, wateringDuration, dateWateringConcluded, wateringInitialTime);
                    } else wateringPlanRepository.wateringFertigationOperationRegister(wateringSector, wateringDuration, dateWateringConcluded, wateringInitialTime, Integer.parseInt(fertigationMix));
                }
            }
            sc.close();
            removeConcludedWateringLines(fileName);
        } catch (Exception e){
            return false;
        }
        return true;
    }

    private void removeConcludedWateringLines(String fileName){
        try {
            List<String> nonConcludedWaterings = new ArrayList<>();
            Scanner sc = new Scanner(new File(Files.resourcesPath + fileName));
            String header = sc.nextLine();
            nonConcludedWaterings.add(header);
            while(sc.hasNextLine()){
                String line = sc.nextLine();
                String[] wateringPlanData = line.split(";");
                boolean isWateringConcluded = "Sim".equals(wateringPlanData[6]);
                if(!isWateringConcluded){
                    nonConcludedWaterings.add(line);
                }
            }
            sc.close();
            PrintWriter pw = new PrintWriter(new FileWriter(Files.resourcesPath + fileName));
            for(String line : nonConcludedWaterings){
                pw.println(line);
            }
            pw.close();
        } catch (IOException e){
            e.printStackTrace();
        }
    }

    public List<WateringPlan> getWateringPlanList() {
        return wateringPlanRepository.getWateringPlanList();
    }
}
