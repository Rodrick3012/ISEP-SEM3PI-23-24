package sem3pl.dei.isep.ipp.pt.esinf.sprint2;

import sem3pl.dei.isep.ipp.pt.MainMenu;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.repository.DistributionNetwork;

import java.util.InputMismatchException;
import java.util.Scanner;

public class BasketRoutingDelivery implements Runnable {
    private final Scanner sc = new Scanner(System.in);

    private DistributionNetwork distributionNetwork;

    public BasketRoutingDelivery(){
    }

    public void run(){
        System.out.println("Welcome to Basket Routing & Delivery Application!");
        System.out.println();
        basketRoutingDeliveryMenu();
    }

    private void basketRoutingDeliveryMenu(){
        System.out.println("Choose the functionality you want");
        System.out.println();
        System.out.println("1. Build the distribution network"); // USEI01
        System.out.println("2. Determine the ideal vertices for the localization of hubs"); // USEI02
        System.out.println("3. Calculate the minimum distance between two more remote locals"); // USEI03
        System.out.println("4. Divides the network into clusters"); // USEI05
        System.out.println("5. Exit");
        System.out.println();
        System.out.println("Select your option: ");
        try {
        int option = sc.nextInt();
        switch (option){
            case 1:
                boolean verify = distributionNetwork.createDistributionNetwork();
                if(!verify){
                    System.out.println("Error while creating the network.");
                } else System.out.println("Network successfully created!");
                basketRoutingDeliveryMenu();
                break;
            case 2:
                if(!distributionNetwork.isEmpty()){
                    System.out.println("USEI02");
                } else System.out.println("Graph is empty. Returning to menu.");
                basketRoutingDeliveryMenu();
                break;
            case 3:
                if(!distributionNetwork.isEmpty()){
                    System.out.println("USEI03");
                } else System.out.println("Graph is empty. Returning to menu.");
                basketRoutingDeliveryMenu();
                break;
            case 4:
                if(!distributionNetwork.isEmpty()){
                    System.out.println("USEI04");
                } else System.out.println("Graph is empty. Returning to menu.");
                basketRoutingDeliveryMenu();
                break;
            case 5:
                System.out.println("Do you really want to exit this app?");
                sc.nextLine();
                String exitOption = sc.nextLine();
                if (exitOption.equalsIgnoreCase("Yes") || exitOption.equalsIgnoreCase("Y")) {
                    MainMenu mainMenu = new MainMenu();
                    mainMenu.run();
                } else basketRoutingDeliveryMenu();
                break;
            default:
                System.out.println("Invalid Option. Please Try Again.");
                System.out.println();
                sc.next();
                basketRoutingDeliveryMenu();
                break;
        }
        } catch (InputMismatchException e){
            System.out.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            basketRoutingDeliveryMenu();
        }
    }
}
