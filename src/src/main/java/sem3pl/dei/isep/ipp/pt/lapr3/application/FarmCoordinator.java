package sem3pl.dei.isep.ipp.pt.lapr3.application;

import sem3pl.dei.isep.ipp.pt.bddad.ImportLegacyController;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.esinf.application.BasketRoutingDelivery;
import sem3pl.dei.isep.ipp.pt.lapr3.application.menus.WateringUI;
import sem3pl.dei.isep.ipp.pt.lapr3.application.menus.operationsUI.OperationsUI;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class FarmCoordinator implements Runnable {
    private final Scanner sc = new Scanner(System.in);
    public FarmCoordinator(){
    }

    public void run(){
        System.out.println("Welcome to Farm Coordinator Application!");
        System.out.println();
        farmCoordinatorMenu();
    }

    private void farmCoordinatorMenu(){
        System.out.println("Choose the functionality you want");
        System.out.println();
        System.out.println("1. Access the irrigation sector menu");
        System.out.println("2. Access to Basket Routing and Delivery");
        System.out.println("3. Perform farm operations");
        System.out.println("4. Import legacy file");
        System.out.println("5. Exit");
        System.out.println();
        System.out.println("Select your option: ");
        try {
            int option = sc.nextInt();
            switch (option) {
                case 1:
                    WateringUI wateringUI = new WateringUI();
                    wateringUI.run();
                    break;
                case 2:
                    BasketRoutingDelivery basketRoutingDelivery = new BasketRoutingDelivery();
                    basketRoutingDelivery.run();
                    break;
                case 3:
                    OperationsUI operationsUI = new OperationsUI();
                    operationsUI.run();
                    break;
                case 4:
                    ImportLegacyController importLegacyController = new ImportLegacyController();
                    importLegacyController.writeSQLToFile(importLegacyController.readFile("Legacy_Data.xlsx"),"docs/Sprint 2/BDDAD/USBD22/insert.sql");
                    System.out.println("File imported successfully.");
                    System.out.println();
                    farmCoordinatorMenu();
                    break;
                case 5:
                    System.out.println("Do you really want to exit the app?");
                    sc.nextLine();
                    String exitOption = sc.nextLine();
                    if (exitOption.equalsIgnoreCase("Yes") || exitOption.equalsIgnoreCase("Y")) {
                        try {
                            DatabaseConnection.getInstance().closeConnection();
                        } catch (SQLException e){
                        }
                        System.exit(0);
                    } else {
                        farmCoordinatorMenu();
                    }
                    break;
                default:
                    System.err.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    farmCoordinatorMenu();
                    break;
            }
        } catch (InputMismatchException e){
            System.err.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            farmCoordinatorMenu();
        }
    }
}
