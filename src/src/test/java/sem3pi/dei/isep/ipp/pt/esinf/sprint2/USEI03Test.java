package sem3pi.dei.isep.ipp.pt.esinf.sprint2;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.ShortestPath;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation.USEI03;

import java.util.Optional;

import static org.junit.Assert.*;

public class USEI03Test {
    @Test
    public void testShortestPathWithVariousAutonomy(){
        USEI03 usei03 = new USEI03();

        // Test for 400000 meters of autonomy

        ShortestPath shortestPathValues =usei03.getShortestPathBetweenTwoMostRemoteLocals(400000);
        assertEquals("CT61", shortestPathValues.getPath().get(0).toString()); // Origin
        assertEquals("[CT61, CT149, CT14, CT280, CT308, CT161, CT284, CT85, CT132, CT55, CT124, CT77, CT188, CT97, CT25, CT123, CT271, CT42, CT296, CT204, CT264, CT131, CT267, CT310, CT17, CT302]", shortestPathValues.getPath().toString());
        assertEquals("[37586, 22576, 24044, 14341, 19079, 23530, 19014, 17165, 23231, 30423, 38870, 40481, 28555, 10781, 18136, 12148, 40995, 45119, 45694, 5259, 52455, 40889, 30348, 49045, 30934]", shortestPathValues.getDistances().toString());
        assertEquals("CT302", shortestPathValues.getPath().get(shortestPathValues.getPath().size()-1).toString()); // Destiny
        assertEquals(Optional.of(530135), Optional.of(shortestPathValues.getTotalDistance()));
        assertEquals(Optional.of(1), Optional.of(shortestPathValues.getRefuelingPoints()));

        // Test for 10 meters of autonomy

        ShortestPath shortestPathValues1 =usei03.getShortestPathBetweenTwoMostRemoteLocals(10);
        assertThrows(IndexOutOfBoundsException.class, () -> shortestPathValues1.getPath().get(0)); // Origin
        assertEquals("[]", shortestPathValues1.getPath().toString());
        assertEquals("[]", shortestPathValues1.getDistances().toString());
        assertThrows(IndexOutOfBoundsException.class, () -> shortestPathValues1.getPath().get(shortestPathValues1.getPath().size()-1)); // Destiny
        assertEquals(Optional.of(0), Optional.of(shortestPathValues1.getTotalDistance()));
        assertEquals(Optional.of(0), Optional.of(shortestPathValues1.getRefuelingPoints()));

        // Test for 1000000 meters of autonomy

        ShortestPath shortestPathValues2 = usei03.getShortestPathBetweenTwoMostRemoteLocals(1000000);
        assertEquals("CT61", shortestPathValues2.getPath().get(0).toString()); // Origin
        assertEquals("[CT61, CT149, CT14, CT280, CT308, CT161, CT284, CT85, CT132, CT55, CT124, CT77, CT315, CT126, CT222, CT180, CT296, CT8, CT131, CT249, CT310, CT17, CT302]", shortestPathValues2.getPath().toString());
        assertEquals("[37586, 22576, 24044, 14341, 19079, 23530, 19014, 17165, 23231, 30423, 38870, 26892, 34316, 27495, 40958, 42143, 38680, 23819, 24221, 37748, 49045, 30934]", shortestPathValues2.getDistances().toString());
        assertEquals("CT302", shortestPathValues2.getPath().get(shortestPathValues2.getPath().size()-1).toString()); // Destiny
        assertEquals(Optional.of(646110), Optional.of(shortestPathValues2.getTotalDistance()));
        assertEquals(Optional.of(0), Optional.of(shortestPathValues2.getRefuelingPoints()));
    }
}
