package sem3pl.dei.isep.ipp.pt.lapr3.application.menus;

import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.WateringController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringPlan;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Files;

import java.util.*;

public class WateringUI implements Runnable {
    private final WateringController wateringController = new WateringController();
    private final Scanner sc = new Scanner(System.in);

    public WateringUI() {
    }

    public void run() {
        System.out.println("Welcome to Watering Menu!");
        System.out.println();
        wateringMenu();
    }

    private void wateringMenu() {
        System.out.println("Choose a functionality of the watering menu to do");
        System.out.println();
        System.out.println("1. Select a File to import and create Watering Plan");
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
                    List<WateringPlan> wateringPlans = wateringController.getWateringPlanList();
                    if(!wateringPlans.isEmpty()) {
                        selectWateringPlanAndWriteConditions();
                    } else {
                        System.out.println("Empty data. Returning to menu...");
                        wateringMenu();
                    }
                    break;
                case 3:
                    System.out.println("Do you really want to exit this menu?");
                    sc.nextLine();
                    String exitOption = sc.nextLine();
                    if (exitOption.equalsIgnoreCase("Yes") || exitOption.equalsIgnoreCase("Y")) {
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

    private void selectFile() {
        System.out.println("Write the file name to read: ");
        sc.nextLine();
        String fileName = sc.nextLine();
        boolean success = wateringController.readFile(Files.resourcesPath + fileName);
        if (success) {
            System.out.println("File successfully imported! Watering Plan created.");
        } else {
            System.out.println("Error while importing a file. Watering Plan not created.");
        }
        System.out.println();
        wateringMenu();
    }

    private void selectWateringPlanAndWriteConditions() {
        WateringPlan wateringPlan = selectWateringPlan();
        int month = inputMonth();
        int day = inputDay();
        int hour = inputHour();
        int minute = inputMinute();
        boolean checked = checkDateData(month, day, hour, minute);
        if(checked) {
            Map<Character, Integer> sectorsAreWatering = wateringController.verifiesThatIsWatering(wateringPlan, month, day, hour, minute);
            Iterator<Map.Entry<Character, Integer>> iterator = sectorsAreWatering.entrySet().iterator();
            System.out.println();
            System.out.printf("Sectors are Watering in %d/%d, %d:%d%n", day, month, hour, minute);
            System.out.println();
            while (iterator.hasNext()) {
                Map.Entry<Character, Integer> entry = iterator.next();
                System.out.println("Sector: " + entry.getKey() + "\nMinutes Until End Watering: " + entry.getValue());
            }
            System.out.println();
            wateringMenu();
        } else wateringMenu();
    }

    private boolean checkDateData(int month, int day, int hour, int minute){
        System.out.println("Inputted data: ");
        System.out.printf("%d/%d , %d:%d", day, month, hour, minute);
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
        int minute;
        try {
            minute = sc.nextInt();
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