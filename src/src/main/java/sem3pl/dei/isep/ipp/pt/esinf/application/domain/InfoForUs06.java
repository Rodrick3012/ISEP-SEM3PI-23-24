package sem3pl.dei.isep.ipp.pt.esinf.application.domain;


import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.util.*;

public class InfoForUs06 {


    private Map<LinkedList<Locals>, ResultDataTotalSemi> pathsData;


    public InfoForUs06(Map<LinkedList<Locals>, ResultDataTotalSemi> pathsData) {
        this.pathsData = pathsData;
    }


    public Map<LinkedList<Locals>, ResultDataTotalSemi> getPathsData() {
        return pathsData;
    }


    // Método para imprimir informações
    public void printTravelSet() {
        for (Map.Entry<LinkedList<Locals>, ResultDataTotalSemi> entry : pathsData.entrySet()) {
            LinkedList<Locals> path = entry.getKey();
            ResultDataTotalSemi resultData = entry.getValue();

            System.out.println("Path: " + formatPath(path));
            System.out.println(resultData.getTravelTime());
            System.out.println("Total Distance: " + resultData.getTotalDistance() + "m");
            System.out.println("Distances:");

            for (Map.Entry<Locals, Integer> distanceEntry : resultData.getDistances().entrySet()) {
                System.out.println(distanceEntry.getKey() + ": " + distanceEntry.getValue() + "m");
            }

            System.out.println();
        }
    }


    // Método auxiliar para formatar o caminho como "vertice de origem - vertice de destino"
    private String formatPath(LinkedList<Locals> path) {
        StringBuilder formattedPath = new StringBuilder();
        for (int i = 0; i < path.size(); i++) {
            formattedPath.append(path.get(i));
            if (i < path.size() - 1) {
                formattedPath.append(" - ");
            }
        }
        return formattedPath.toString();
    }

}



