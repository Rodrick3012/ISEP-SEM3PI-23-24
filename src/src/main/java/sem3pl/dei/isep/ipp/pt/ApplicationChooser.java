package sem3pl.dei.isep.ipp.pt;

import sem3pl.dei.isep.ipp.pt.bddad.ImportLegacyController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ApplicationChooser implements Runnable {
    private final Scanner sc = new Scanner(System.in);
    @Override
    public void run() {
        applicationChooserMenu();
    }

    private void applicationChooserMenu(){
        System.out.println("Choose the app to run:");
        System.out.println();
        System.out.println("1. Farm Coordinator");
        System.out.println("2. Import Legacy File");
        System.out.println("3. Exit");
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
                    ImportLegacyController importLegacyController = new ImportLegacyController();
                    importLegacyController.writeSQLToFile(importLegacyController.readFile("Legacy_Data.xlsx"),"docs/Sprint 2/BDDAD/USBD22/insert.sql");
                    System.out.println("File imported successfully.");
                    System.out.println();
                    applicationChooserMenu();
                    break;
                case 3:
                    System.out.println("Exiting...");
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    applicationChooserMenu();
                    break;
            }
        } catch (InputMismatchException e){
            System.out.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            applicationChooserMenu();
        }
    }
}
