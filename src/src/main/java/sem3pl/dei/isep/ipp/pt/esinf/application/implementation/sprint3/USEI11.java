package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;

import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class USEI11 {

    public static boolean loadHubSchedules(Graph graph, String filePath) {
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String hubId = parts[0].trim();
                    LocalTime openingTime = LocalTime.parse(parts[1].trim());
                    LocalTime closingTime = LocalTime.parse(parts[2].trim());


                    if (graph.containHub(hubId)){
                        graph.getLocal(hubId).setTime(openingTime,closingTime);
                    } else {
                        // Hub doesn't exist, add new schedule
                        System.out.println("The hub "+hubId+" doesn't exists");
                    }

                } else {
                    System.err.println("Invalid line: " + line);
                }
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
