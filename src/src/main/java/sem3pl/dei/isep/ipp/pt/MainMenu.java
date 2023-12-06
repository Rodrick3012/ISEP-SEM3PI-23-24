package sem3pl.dei.isep.ipp.pt;

import sem3pl.dei.isep.ipp.pt.bddad.ImportLegacyController;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.esinf.application.BasketRoutingDelivery;
import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;

import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class MainMenu implements Runnable {
    private final Scanner sc = new Scanner(System.in);
    @Override
    public void run() {
        applicationChooserMenu();
    }

    private void applicationChooserMenu(){
        System.out.println("Choose the app to run:");
        System.out.println();
        System.out.println("1. Farm Coordinator");
        System.out.println("2. Basket Routing & Delivery");
        System.out.println("3. Import Legacy File");
        System.out.println("4. Exit");
        System.out.println();
        System.out.println("Select a option: ");
        try {
            int option = sc.nextInt();
            switch (option) {
                case 1:
                    FarmCoordinator farmCoordinator = new FarmCoordinator();
                    farmCoordinator.run();
                    break;
                case 2:
                    BasketRoutingDelivery basketRoutingDelivery = new BasketRoutingDelivery();
                    basketRoutingDelivery.run();
                    break;
                case 3:
                    ImportLegacyController importLegacyController = new ImportLegacyController();
                    importLegacyController.writeSQLToFile(importLegacyController.readFile("Legacy_Data.xlsx"),"docs/Sprint 2/BDDAD/USBD22/insert.sql");
                    System.out.println("File imported successfully.");
                    System.out.println();
                    applicationChooserMenu();
                    break;
                case 4:
                    System.out.println("Exiting...");
                    try {
                        DatabaseConnection.getInstance().closeConnection();
                    } catch (SQLException e){
                    }
                    System.exit(0);
                    break;
                default:
                    System.err.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    applicationChooserMenu();
                    break;
            }
        } catch (InputMismatchException e){
            System.err.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            applicationChooserMenu();
        }
    }
}
