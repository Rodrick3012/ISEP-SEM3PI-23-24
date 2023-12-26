package sem3pi.dei.isep.ipp.pt.esinf.sprint3;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;

import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3.USEI11;

import java.time.LocalTime;

import static org.junit.Assert.assertEquals;



public class USEI11Test {
    @Test
    public void usei11(){
        USEI01 usei01 = new USEI01();
        CommonGraph<Locals, Integer> graph = usei01.readToGraph("src/test/resources/locais_big.csv", "src/test/resources/distancias_big.csv");

        Locals local1 =graph.getVertexByLocalsID("CT1");
        Locals local2 = graph.getVertexByLocalsID("CT214");


        // Convert string times to LocalTime
        LocalTime expectedOpeningTimeLocal1 = LocalTime.parse("09:00");
        LocalTime expectedClosingTimeLocal1 = LocalTime.parse("14:00");
        LocalTime expectedOpeningTimeLocal2 = LocalTime.parse("11:00");
        LocalTime expectedClosingTimeLocal2 = LocalTime.parse("16:00");

        // Assert using LocalTime objects
        assertEquals(expectedOpeningTimeLocal1, (local1.getOpeningTime()));
        assertEquals(expectedClosingTimeLocal1, (local1.getClosingTime()));
        assertEquals(expectedOpeningTimeLocal2, (local2.getOpeningTime()));
        assertEquals(expectedClosingTimeLocal2, (local2.getClosingTime()));

        USEI11 usei11 = new USEI11(graph,"src/test/resources/horarioFuncHub");


        // Convert string times to LocalTime
        LocalTime expectedOpeningTimeLocal12 = LocalTime.parse("14:00");
        LocalTime expectedClosingTimeLocal12 = LocalTime.parse("17:00");
        LocalTime expectedOpeningTimeLocal22 = LocalTime.parse("11:00");
        LocalTime expectedClosingTimeLocal22 = LocalTime.parse("15:30");

        // Assert using LocalTime objects
        assertEquals(expectedOpeningTimeLocal12, (local1.getOpeningTime()));
        assertEquals(expectedClosingTimeLocal12, (local1.getClosingTime()));
        assertEquals(expectedOpeningTimeLocal22, (local2.getOpeningTime()));
        assertEquals(expectedClosingTimeLocal22, (local2.getClosingTime()));

    }


}
