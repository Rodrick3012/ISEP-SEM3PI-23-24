package sem3pl.dei.isep.ipp.pt.application.menus;

import sem3pl.dei.isep.ipp.pt.application.FarmCoordinator;
import sem3pl.dei.isep.ipp.pt.application.controller.WateringController;

import java.util.Scanner;

public class WateringUI implements Runnable {
    private final WateringController wateringController = new WateringController();
    private final Scanner sc = new Scanner(System.in);
    public WateringUI(){
    }

    public void run(){
        wateringMenu();
    }

    private void wateringMenu(){
        System.out.println();
        System.out.println("1. Select a File to import and create Watering Plan");
        System.out.println("2. View the Sectors are Watering");
        System.out.println("3. Exit");
        System.out.println();
        System.out.println("Select a option: ");
        int option = sc.nextInt();
        switch (option){
            case 1:
                selectFile();
            case 2:
               // wateringConditions();
            case 3:
                FarmCoordinator farmCoordinator = new FarmCoordinator();
                farmCoordinator.run();
            default:
                System.out.println("Invalid Option. Please Try Again.");
                System.out.println();
                wateringMenu();
        }
    }
    private void selectFile(){
        System.out.println("Write the file name to read: ");
        String fileName = sc.nextLine();
        boolean success = wateringController.readFile(fileName);
        if(success){
            System.out.println("File successfully imported! Watering Plan created.");
        } else {
            System.out.println("Error while importing a file. Watering Plan not created.");
        }
        System.out.println();
        wateringMenu();
    }

}
