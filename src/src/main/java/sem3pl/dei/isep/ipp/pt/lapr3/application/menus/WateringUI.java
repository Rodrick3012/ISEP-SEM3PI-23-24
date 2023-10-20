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
        System.out.println("2. View the Sectors are Watering");
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
                    selectWateringPlanAndWriteConditions();
                    break;
                case 3:
                    System.out.println("Do you really want to exit this menu?");
                    sc.nextLine();
                    String exitOption = sc.nextLine();
                    if (exitOption.equalsIgnoreCase("Yes") || exitOption.equalsIgnoreCase("Y")) {
                        FarmCoordinator farmCoordinator = new FarmCoordinator();
                        farmCoordinator.run();
                    } else wateringMenu();
                    break;
                default:
                    System.out.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    sc.next();
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
        Map<Character, Boolean> verificationWatering = wateringController.verifiesThatIsWatering(wateringPlan, month, day, hour, minute);
        Iterator<Map.Entry<Character, Boolean>> iterator = verificationWatering.entrySet().iterator();
        System.out.printf("Watering Status in %d of %d in %d:%d%n", day, month, hour, minute);
        System.out.println();
        while(iterator.hasNext()){
            Map.Entry<Character, Boolean> entry = iterator.next();
            System.out.println("Sector: " + entry.getKey() + " Watering: " + entry.getValue());
        }
        System.out.println();
        System.out.println("Press any key to leave...");
        Scanner scanner = new Scanner(System.in);
        try {
            System.in.read();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            scanner.close();
        }
        sc.next();
        wateringMenu();
    }

    private int inputMonth() {
        System.out.println("Write the Month: ");
        int month = 0;
        try {
            month = sc.nextInt();
            if (month <= 0 || month > 12) {
                System.out.println("Invalid Month. Please Try Again.");
                System.out.println();
                sc.nextLine();
                inputMonth();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Month. Please Try Again.");
            System.out.println();
            sc.next();
            inputMonth();
        }
        return month;
    }

    private int inputDay() {
        System.out.println("Write the Day: ");
        int day = 0;
        try {
            day = sc.nextInt();
            if (day <= 0 || day > 30) {
                System.out.println("Invalid Day. Please Try Again.");
                System.out.println();
                sc.nextLine();
                inputDay();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Day. Please Try Again.");
            System.out.println();
            sc.next();
            inputDay();
        }
        return day;
    }

    private int inputHour() {
        System.out.println("Write the Hour: ");
        int hour = -1;
        try {
            hour = sc.nextInt();
            if (hour < 0 || hour > 24) {
                System.out.println("Invalid Hour. Please Try Again.");
                System.out.println();
                sc.nextLine();
                inputHour();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Hour. Please Try Again.");
            System.out.println();
            sc.next();
            inputHour();
        }
        return hour;
    }

    private int inputMinute() {
        System.out.println("Write the Minute: ");
        int minute = -1;
        try {
            minute = sc.nextInt();
            if (minute < 0 || minute > 60) {
                System.out.println("Invalid Minute. Please Try Again.");
                System.out.println();
                sc.nextLine();
                inputMinute();
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Minute. Please Try Again.");
            System.out.println();
            sc.next();
            inputMinute();
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