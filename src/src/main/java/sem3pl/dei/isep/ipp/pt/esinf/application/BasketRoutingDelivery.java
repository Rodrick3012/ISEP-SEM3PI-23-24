package sem3pl.dei.isep.ipp.pt.esinf.application;

import org.apache.commons.lang.ObjectUtils;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.*;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI02;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI03;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI04;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3.*;
import sem3pl.dei.isep.ipp.pt.esinf.application.repository.DistributionNetwork;
import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Files;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Utils;

import java.time.LocalTime;
import java.util.*;

public class BasketRoutingDelivery implements Runnable {
    private final Scanner sc = new Scanner(System.in);

    private DistributionNetwork distributionNetwork = new DistributionNetwork();

    public BasketRoutingDelivery() {
    }

    public void run() {
        System.out.println("Welcome to Basket Routing & Delivery Application!");
        System.out.println();
        basketRoutingDeliveryMenu();
    }

    private void basketRoutingDeliveryMenu() {
        System.out.println("Choose the functionality you want");
        System.out.println();
        System.out.println("1. Build the distribution network [USEI01]"); // USEI01
        System.out.println("2. Determine the ideal vertices for the localization of hubs [USEI02]"); // USEI02
        System.out.println("3. Calculate the minimum distance between two more remote locals [USEI03]"); // USEI03
        System.out.println("4. Create the network with all locals with a minimum cost [USEI04]"); // USEI04
        System.out.println("5. Finding for a producer the different routes they can take between a place of origin and a hub limited by km [USEI06]");
        System.out.println("6. Find the delivery circuit that starts from a origin location, passes through N hubs and returns to the origin location minimizing the total distance traveled [USEI08]");
        System.out.println("7. Update hubs schedule [USEI11]");
        System.out.println("8. Organize the locals into N clusters with 1 hub per cluster [USEI09]");
        System.out.println("9. Find the route for a producer departing from an origin location that maximizes the number of hubs it passes through. [USEI07]");
        System.out.println("10. Exit");
        System.out.println();
        System.out.println("Select your option: ");
        try {
            int option = sc.nextInt();
            switch (option) {
                case 1:
                    selectDistributionNetwork();
                    break;
                case 2:
                    try {
                        if (!distributionNetwork.isEmpty()) {
                            Graph<Locals, Integer> graph = distributionNetwork.getGraph();
                            int nHubs = Utils.readInt("Write the number of hubs");
                            ArrayList<List<LocationCriteria>> localsList = USEI02.optimizeLocations(graph, nHubs);
                        } else System.err.println("Network is empty. Returning to menu.");
                    } catch (NullPointerException e) {
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
                    } catch (NullPointerException e) {
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
                    } catch (NullPointerException e) {
                        System.err.println("Network is empty. Returning to menu.");
                    }
                    basketRoutingDeliveryMenu();
                    break;

                case 5:
                    try {
                        if (!distributionNetwork.isEmpty()) {
                            CommonGraph<Locals, Integer> graph = distributionNetwork.getGraph();
                            Integer autonomy = Utils.readInt("Write the autonomy of the vehicle");
                            Integer averageSpeed = Utils.readInt("Write the average speed of the vehicle");
                            Locals originVertice = Utils.selectLocalidade("Choose the origin location", graph.vertices());
                            Locals destinyVertice = Utils.selectLocalidade("Choose the destiny location", graph.vertices());

                            InfoForUs06 infoForUs06 = USEI06.organizeInformation(graph, originVertice, destinyVertice, autonomy, averageSpeed);
                            infoForUs06.printTravelSet();


                        } else System.err.println("Network is empty. Returning to menu.");
                    } catch (NullPointerException e) {
                        System.err.println("Network is empty. Returning to menu.");
                    }
                    basketRoutingDeliveryMenu();
                    break;
                case 6:
                    try {
                        if (!distributionNetwork.isEmpty()) {
                            CommonGraph<Locals, Integer> graph = distributionNetwork.getGraph();
                            Integer autonomy = Utils.readInt("Write the autonomy of the vehicle");
                            Double averageSpeed = Utils.readDouble("Write the average speed of the vehicle");
                            Locals originVertice = Utils.selectLocalidade("Choose the origin location", graph.vertices());
                            USEI02 usei02 = new USEI02();
                            Integer nrHubs = Utils.readInt("How many hubs should be selected");
                            List<Locals> hubs = usei02.obterVerticesPorMaiorGrau(graph, nrHubs);
                            InfoForUs08 infoForUs08 = USEI08.findOptimalCircuit(graph, hubs, originVertice, autonomy, averageSpeed);
                            System.out.println(infoForUs08.toString());
                        } else System.err.println("Network is empty. Returning to menu.");
                    } catch (NullPointerException e) {
                        System.err.println("Network is empty. Returning to menu.");
                    }
                    basketRoutingDeliveryMenu();
                    break;
                case 7:
                    try {
                        if (!distributionNetwork.isEmpty()) {
                            System.out.println("Write the file name to read: ");
                            sc.nextLine();
                            String fileName = sc.nextLine();
                            boolean importSuccess = USEI11.loadHubSchedules(distributionNetwork.getGraph(), Files.resourcesPath + fileName);
                            if (importSuccess) {
                                System.out.println("File successfully imported!");
                            } else {
                                System.err.println("Error while importing a file.");
                            }
                        } else System.err.println("Network is empty. Returning to menu.");
                    } catch (NullPointerException e) {
                        System.err.println("Network is empty. Returning to menu.");
                    }
                    basketRoutingDeliveryMenu();
                    break;
                case 8:
                    try {
                        if(!distributionNetwork.isEmpty()){
                            USEI09 usei09 = new USEI09();
                            Integer nClusters = Utils.readInt("Write the number of clusters");
                            Map<Locals, Set<Locals>> result = usei09.organizeClusters(distributionNetwork.getGraph(), nClusters);
                            System.out.println("Hubs: " + result.keySet());
                            System.out.println();
                            int i = 0;
                            for(Map.Entry<Locals, Set<Locals>> entry : result.entrySet()){
                                i++;
                                System.out.println("Hub " + i + ": " + entry.getKey().toString());
                                System.out.println("Associated Cluster: " + entry.getValue().toString());
                                System.out.println();
                            }
                        } else System.err.println("Network is empty. Returning to menu.");
                    } catch (NullPointerException e) {
                        System.err.println("Network is empty. Returning to menu.");
                    }
                    basketRoutingDeliveryMenu();
                    break;
                case 9:
                    try {
                        if(!distributionNetwork.isEmpty()) {
                            Graph<Locals, Integer> graph = distributionNetwork.getGraph();
                            int nHubs = Utils.readInt("Write the number of hubs");
                            int velocidade = Utils.readInt("Write the avarage speed");
                            int descarga = Utils.readInt("Write the unloading time");
                            int autonomia = Utils.readInt("Write the autonomy");
                            int hour = Utils.readInt("Write the hour");
                            int minute = Utils.readInt("Write the minute");
                            int second = Utils.readInt("Write the second");
                            LocalTime time = LocalTime.of(hour, minute, second);

                            List<PathMaxHubs> result=new ArrayList<>();
                            USEI07 usei07 = new USEI07();

                            USEI02 usei02 = new USEI02();

                            List<Locals> hubs =  usei02.obterVerticesPorMaiorGrau(graph, nHubs);

                            List<Edge<Locals,Integer>> ListEdges = new ArrayList<>();

                            Map<String,Integer> stats = usei07.us07_method(graph,graph.vertices().get(0),ListEdges,hubs,time,velocidade,descarga,autonomia,result);

                            System.out.println();System.out.println("Results:");

                            for(PathMaxHubs i : result){
                                System.out.println("Local: " + i.getLocais() + ", Hub: " + i.getHub()+ ", Chegada: " + i.getChegada()+ ", Partida: " + i.getPartida());
                            }

                            System.out.println(stats);System.out.println();System.out.println();


                        } else System.err.println("Network is empty. Returning to menu.");
                    } catch (NullPointerException e) {
                        System.err.println("Network is empty. Returning to menu.");
                    }
                    basketRoutingDeliveryMenu();
                    break;
                case 10:
                    System.out.println("Do you really want to exit this app?");
                    sc.nextLine();
                    String exitOption = sc.nextLine();
                    if (exitOption.equalsIgnoreCase("Yes") || exitOption.equalsIgnoreCase("Y")) {
                        FarmCoordinator farmCoordinator = new FarmCoordinator();
                        farmCoordinator.run();
                    } else basketRoutingDeliveryMenu();

                    break;
                default:
                    System.err.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    sc.next();
                    basketRoutingDeliveryMenu();
                    break;
            }
        } catch (InputMismatchException e) {
            System.err.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            basketRoutingDeliveryMenu();
        }
    }

    private void selectDistributionNetwork(){
        System.out.println("Select your type of distribution:");
        System.out.println();
        System.out.println("1. Big (more complete)");
        System.out.println("2. Small (more efficient)");
        System.out.println("3. Exit");
        System.out.println();
        System.out.println("Select your option: ");
        try {
            int option = sc.nextInt();
            switch (option){
                case 1:
                    boolean verifyBig = distributionNetwork.createDistributionNetworkBig();
                    if (!verifyBig) {
                        System.err.println("Error while creating the network.");
                    } else System.out.println("Network successfully created!");
                    basketRoutingDeliveryMenu();
                    break;
                case 2:
                    boolean verifySmall = distributionNetwork.createDistributionNetworkSmall();
                    if (!verifySmall) {
                        System.err.println("Error while creating the network.");
                    } else System.out.println("Network successfully created!");
                    basketRoutingDeliveryMenu();
                    break;
                case 3:
                    basketRoutingDeliveryMenu();
                    break;
                default:
                    System.err.println("Invalid Option. Please Try Again.");
                    System.out.println();
                    sc.next();
                    selectDistributionNetwork();
                    break;
            }
        } catch (InputMismatchException e){
            System.err.println("Invalid Option. Please Try Again.");
            System.out.println();
            sc.next();
            selectDistributionNetwork();
        }
    }
}
