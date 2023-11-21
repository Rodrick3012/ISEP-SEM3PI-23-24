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
        ShortestPath shortestPathValues =usei03.getShortestPathBetweenTwoMostRemoteLocals(671420);
        assertTrue(shortestPathValues.getPath().isEmpty());
    }
}
