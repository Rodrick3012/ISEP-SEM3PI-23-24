package sem3pl.dei.isep.ipp.pt.lapr3.application.menus.operationsUI;

import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;

import java.util.*;

public class OperationsUI implements Runnable {
    //private final OperationsController operationsController = new OperationsController();
    private final Scanner sc = new Scanner(System.in);

    public OperationsUI() {
    }

    public void run() {
        System.out.println("Welcome to Operations Menu!");
        System.out.println();
        OperationsMenu();
    }

    private void OperationsMenu() {
        System.out.println("Choose a functionality of the operations menu to do");
        System.out.println();
        System.out.println("1. Record sowing operation");
        System.out.println("2. Record weeding operation");
        System.out.println("3. Record harvesting operation");
        System.out.println("4. Record application operation factor of production");
        System.out.println("5. Record pruning operation");
        System.out.println("6. Exit");
        System.out.println();
        System.out.println("Select a option: ");
        try {
            int option = sc.nextInt();
            OperationRegisterUI operationRegisterUI= new OperationRegisterUI();
            switch (option) {
                case 1:
                    operationRegisterUI.run("sementeira");
                    break;
                case 2:
                    operationRegisterUI.run("Monda");
                    break;
                case 3:
                    operationRegisterUI.run("Colheita");
                    break;

                case 4:

                    break;

                case 5:
                    operationRegisterUI.run("Poda");
                    break;
                case 6:
                    FarmCoordinator farmCoordinator = new FarmCoordinator();
                    farmCoordinator.run();
                    break;
                default:
                    System.out.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    OperationsMenu();
                    break;
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            OperationsMenu();
        }
    }


}