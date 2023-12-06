package sem3pl.dei.isep.ipp.pt.esinf.application;

import sem3pl.dei.isep.ipp.pt.MainMenu;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.ShortestPath;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI02;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI03;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI04;
import sem3pl.dei.isep.ipp.pt.esinf.application.repository.DistributionNetwork;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Utils;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class BasketRoutingDelivery implements Runnable {
    private final Scanner sc = new Scanner(System.in);

    private DistributionNetwork distributionNetwork = new DistributionNetwork();

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
        System.out.println("4. Create the network with all locals with a minimum cost"); // USEI04
        System.out.println("5. Exit");
        System.out.println();
        System.out.println("Select your option: ");
        try {
        int option = sc.nextInt();
        switch (option){
            case 1:
                boolean verify = distributionNetwork.createDistributionNetwork();
                if(!verify){
                    System.err.println("Error while creating the network.");
                } else System.out.println("Network successfully created!");
                basketRoutingDeliveryMenu();
                break;
            case 2:
                try {
                    if (!distributionNetwork.isEmpty()) {
                        Graph<Locals, Integer> graph = distributionNetwork.getGraph();
                        int nHubs = Utils.readInt("Write the number of hubs");
                        ArrayList<List<LocationCriteria>> localsList = USEI02.optimizeLocations(graph, nHubs);
                    } else System.err.println("Network is empty. Returning to menu.");
                } catch (NullPointerException e){
                    System.err.println("Network is empty. Returning to menu.");
                }
                basketRoutingDeliveryMenu();
                break;
            case 3:
                try {
                    if (!distributionNetwork.isEmpty()) {
                        CommonGraph<Locals, Integer> graph = distributionNetwork.getGraph();
                        Integer autonomy = Utils.readInt("Write the autonomy of the vehicle");
                        USEI03 usei03 = new USEI03();
                        ShortestPath shortestPath = usei03.getShortestPathBetweenTwoMostRemoteLocalsForUI(graph, autonomy);
                        System.out.println(shortestPath.toString());
                    } else System.err.println("Network is empty. Returning to menu.");
                } catch (NullPointerException e){
                    System.err.println("Network is empty. Returning to menu.");
                }
                basketRoutingDeliveryMenu();
                break;
            case 4:
                try {
                    if (!distributionNetwork.isEmpty()) {
                        USEI04 usei04 = new USEI04();
                        usei04.methodForUiLapr();
                    } else System.err.println("Network is empty. Returning to menu.");
                } catch (NullPointerException e){
                    System.err.println("Network is empty. Returning to menu.");
                }
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
                System.err.println("Invalid Option. Please Try Again.");
                System.out.println();
                sc.next();
                basketRoutingDeliveryMenu();
                break;
        }
        } catch (InputMismatchException e){
            System.err.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            basketRoutingDeliveryMenu();
        }
    }
}
