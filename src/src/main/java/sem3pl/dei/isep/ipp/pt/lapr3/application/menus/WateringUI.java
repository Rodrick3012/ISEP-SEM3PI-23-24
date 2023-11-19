package sem3pl.dei.isep.ipp.pt.lapr3.application.menus;

import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.WateringController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringPlan;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Files;

import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class WateringUI implements Runnable {
    private final WateringController wateringController = new WateringController();
    private final Scanner sc = new Scanner(System.in);
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    public WateringUI() {
    }

    public void run() {
        System.out.println("Welcome to Watering Menu!");
        System.out.println();
        scheduler.scheduleAtFixedRate(this::generateAndCheckWateringPlan, 1, 10, TimeUnit.MINUTES);
        wateringMenu();
    }

    private void wateringMenu() {
        System.out.println("Choose a functionality of the watering menu to do");
        System.out.println();
        System.out.println("1. Import File");
        System.out.println("2. View the Sectors that being watered");
        System.out.println("3. Exit");
        System.out.println();
        System.out.println("Select a option: ");
        try {
            int option = sc.nextInt();
            switch (option) {
                case 1:
                    selectFile();
                    break;
                case 2:
                    if(verifyListIsNotEmpty()){
                        selectWateringPlanAndWriteConditions();
                    } else {
                        System.out.println("Empty data. Returning to menu...");
                        wateringMenu();
                    }
                case 3:
                    System.out.println("Do you really want to exit this menu?");
                    sc.nextLine();
                    String exitOption = sc.nextLine();
                    if (exitOption.equalsIgnoreCase("Yes") || exitOption.equalsIgnoreCase("Y")) {
                        stopScheduler();
                        FarmCoordinator farmCoordinator = new FarmCoordinator();
                        farmCoordinator.run();
                    } else {
                        wateringMenu();
                    }
                    break;
                default:
                    System.out.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    wateringMenu();
                    break;
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            wateringMenu();
        }
    }

    private boolean verifyListIsNotEmpty(){
        List<WateringPlan> wateringPlans = wateringController.getWateringPlanList();
        return !wateringPlans.isEmpty();
    }

    private void selectFile() {
        System.out.println("Write the file name to read: ");
        sc.nextLine();
        String fileName = sc.nextLine();
        WateringPlan wateringPlan = wateringController.readFile(Files.resourcesPath + fileName);
        if(wateringController.getWateringPlanList().contains(wateringPlan)) {
            System.out.println("File successfully imported! Watering Plan created.");
        } else {
            System.out.println("Error while importing a file. Watering Plan not created.");
        }
        System.out.println();
        wateringMenu();
    }

    private void generateAndCheckWateringPlan(){
        if(verifyListIsNotEmpty()) {
            List<WateringPlan> wateringPlans = wateringController.getWateringPlanList();
            WateringPlan wateringPlan = wateringPlans.get(0);
            generateWateringPlan(wateringPlan);
        }
        else System.out.println("Empty data. Import a file to create Watering Plan.");
    }

    private void generateWateringPlan(WateringPlan wateringPlan){
        String fileName = wateringController.generateWateringPlan(wateringPlan);
        checkWateringConcluded(fileName);
    }

    private void stopScheduler(){
        scheduler.shutdown();
        try {
            if(!scheduler.awaitTermination(30, TimeUnit.SECONDS)){
                scheduler.shutdownNow();
                if(!scheduler.awaitTermination(30, TimeUnit.SECONDS)){
                    System.err.println("Scheduler did not terminate");
                }
            }
        } catch (InterruptedException e){
            scheduler.shutdownNow();
            Thread.currentThread().interrupt();
        }
    }

    private void checkWateringConcluded(String fileName){
        boolean verified = wateringController.readWateringPlanGeneratedFileAndCheckIfWateringConcluded(fileName);
        if(verified){
            System.out.println("Watering plan successfully generated!");
        } else System.out.println("Error while watering plan being generated.");
        System.out.println();
        wateringMenu();
    }

    private void selectWateringPlanAndWriteConditions() {
        WateringPlan wateringPlan = selectWateringPlan();
        int year = inputYear();
        int month = inputMonth();
        int day = inputDay();
        int hour = inputHour();
        int minute = inputMinute();
        boolean checked = checkDateData(year, month, day, hour, minute);
        if(checked) {
            Map<Integer, Integer> sectorsAreWatering = wateringController.verifiesThatIsWatering(wateringPlan, year, month, day, hour, minute);
            Iterator<Map.Entry<Integer, Integer>> iterator = sectorsAreWatering.entrySet().iterator();
            System.out.println();
            System.out.printf("Sectors are Watering in %02d/%02d , %02d:%02d", day, month, hour, minute);
            System.out.println();
            while (iterator.hasNext()) {
                Map.Entry<Integer, Integer> entry = iterator.next();
                System.out.println("Sector: " + entry.getKey() + "\nMinutes Until End Watering: " + entry.getValue());
            }
            System.out.println();
            wateringMenu();
        } else wateringMenu();
    }

    private boolean checkDateData(int year, int month, int day, int hour, int minute){
        System.out.println("Inputted data: ");
        System.out.printf("%02d/%02d/%02d , %02d:%02d", day, month, year, hour, minute);
        System.out.println();
        boolean checked = false;
        System.out.println("Submit data?");
        sc.nextLine();
        String confirmation = sc.nextLine();
        if(confirmation.equalsIgnoreCase("Yes") || confirmation.equalsIgnoreCase("Y")){
            checked = true;
        }
        return checked;
    }

    private int inputYear(){
        System.out.println("Write the Year: ");
        int year;
        try {
            year = sc.nextInt();
            if (year < 1970 || year > 99999) {
                System.out.println("Invalid Year. Please Try Again.");
                System.out.println();
                sc.nextLine();
                return inputYear();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Year. Please Try Again.");
            System.out.println();
            sc.next();
            return inputYear();
        }
        return year;
    }

    private int inputMonth() {
        System.out.println("Write the Month: ");
        int month;
        try {
            month = sc.nextInt();
            if (month <= 0 || month > 12) {
                System.out.println("Invalid Month. Please Try Again.");
                System.out.println();
                sc.nextLine();
                return inputMonth();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Month. Please Try Again.");
            System.out.println();
            sc.next();
            return inputMonth();
        }
        return month;
    }

    private int inputDay() {
        System.out.println("Write the Day: ");
        int day;
        try {
            day = sc.nextInt();
            if (day <= 0 || day > 30) {
                System.out.println("Invalid Day. Please Try Again.");
                System.out.println();
                sc.nextLine();
                return inputDay();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Day. Please Try Again.");
            System.out.println();
            sc.next();
            return inputDay();
        }
        return day;
    }

    private int inputHour() {
        System.out.println("Write the Hour: ");
        int hour;
        try {
            hour = sc.nextInt();
            if (hour < 0 || hour > 24) {
                System.out.println("Invalid Hour. Please Try Again.");
                System.out.println();
                sc.nextLine();
                return inputHour();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Hour. Please Try Again.");
            System.out.println();
            sc.next();
            return inputHour();
        }
        return hour;
    }

    private int inputMinute() {
        System.out.println("Write the Minute: ");
        String minuteStr = sc.next(); // Read input as a string
        int minute;
        try {
            minute =Integer.parseInt(minuteStr);
            if (minute < 0 || minute > 60) {
                System.out.println("Invalid Minute. Please Try Again.");
                System.out.println();
                sc.nextLine();
                return inputMinute();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Minute. Please Try Again.");
            System.out.println();
            sc.next();
            return inputMinute();
        }
        return minute;
    }

    private int listWateringPlans() {
        List<WateringPlan> wateringPlans = wateringController.getWateringPlanList();
        int i = 0;
        for (WateringPlan wateringPlan : wateringPlans) {
            System.out.println(i+1 + ". " + wateringPlan.toString());
            i++;
        }
        return i;
    }

    private WateringPlan selectWateringPlan() {
        List<WateringPlan> wateringPlans = wateringController.getWateringPlanList();
        WateringPlan wateringPlan = null;
        System.out.println("Select watering Plan: ");
        System.out.println();
        int options = listWateringPlans();
        try {
            int option = sc.nextInt() - 1;
            if (option >= 0 && option <= options) {
                wateringPlan = wateringPlans.get(option);
            } else {
                System.out.println("Invalid Option. Please Try Again.");
                System.out.println();
                sc.nextLine();
                selectWateringPlan();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            selectWateringPlan();
        }
        return wateringPlan;
    }
}