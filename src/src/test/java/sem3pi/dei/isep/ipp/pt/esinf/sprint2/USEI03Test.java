package sem3pi.dei.isep.ipp.pt.esinf.sprint2;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.ShortestPath;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation.USEI03;


import java.util.Optional;

import static org.junit.Assert.assertEquals;

public class USEI03Test {
    @Test
    public void testShortestPathWithVariousAutonomy(){
        USEI03 usei03 = new USEI03();
        ShortestPath shortestPathValues =usei03.getShortestPathBetweenTwoMostRemoteLocals(400000);
        assertEquals("CT61", shortestPathValues.getPath().get(0).toString()); // Local of origin
        assertEquals("[CT61, CT149, CT14, CT280, CT308, CT161, CT284, CT85, CT132, CT55, CT124, CT77, CT315, CT126, CT222, CT180, CT296, CT8, CT131, CT249, CT310, CT17, CT302]", shortestPathValues.getPath().toString());
        assertEquals("[37586, 22576, 24044, 14341, 19079, 23530, 19014, 17165, 23231, 30423, 38870, 26892, 34316, 27495, 40958, 42143, 38680, 23819, 24221, 37748, 49045, 30934]", shortestPathValues.getDistances().toString());
        assertEquals("CT302", shortestPathValues.getPath().get(shortestPathValues.getPath().size()-1).toString()); // Local of destiny
        assertEquals(Optional.of(646110), Optional.of(shortestPathValues.getTotalDistance()));

        // For 400000 meters of autonomy
        assertEquals("[CT124, CT284, CT55, CT77, CT126, CT180, CT296, CT8, CT131, CT249, CT310, CT17, CT302, CT302]", shortestPathValues.getRefuelingPoints().toString());
        assertEquals(Optional.of(14), Optional.of(shortestPathValues.getTotalRefuelings()));

        // For 250000 meters of autonomy
        ShortestPath shortestPathValues1 = usei03.getShortestPathBetweenTwoMostRemoteLocals(250000);
        assertEquals("[CT308, CT222, CT308, CT284, CT132, CT124, CT77, CT315, CT126, CT222, CT180, CT296, CT8, CT131, CT249, CT310, CT17, CT302, CT302]", shortestPathValues1.getRefuelingPoints().toString());
        assertEquals(Optional.of(19), Optional.of(shortestPathValues1.getTotalRefuelings()));

        // For 1000000000 meters of autonomy
        ShortestPath shortestPathValue2 = usei03.getShortestPathBetweenTwoMostRemoteLocals(1000000000);
        assertEquals("[CT302]", shortestPathValue2.getRefuelingPoints().toString());
        assertEquals(Optional.of(1), Optional.of(shortestPathValue2.getTotalRefuelings()));
    }
}
