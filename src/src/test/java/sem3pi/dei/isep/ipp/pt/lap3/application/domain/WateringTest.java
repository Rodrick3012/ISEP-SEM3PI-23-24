package sem3pi.dei.isep.ipp.pt.lap3.application.domain;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Fertigation;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Watering;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringTimeRegularity;

import static org.junit.Assert.assertEquals;

public class WateringTest {
    @Test
    public void assertWateringIsInstantiated(){
        Watering watering = new Watering(10, 10, new WateringTimeRegularity("T"), new Fertigation(12, 12));
        assertEquals(watering, watering);
    }
}
