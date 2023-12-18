package sem3pi.dei.isep.ipp.pt.lap3.application.domain;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Fertigation;

import static org.junit.Assert.assertEquals;

public class FertigationTest {

    @Test
    public void assertFertigationObjectIsInstantiated(){
        Fertigation fertigation = new Fertigation(12, 12);
        assertEquals(fertigation, fertigation);
    }
}
