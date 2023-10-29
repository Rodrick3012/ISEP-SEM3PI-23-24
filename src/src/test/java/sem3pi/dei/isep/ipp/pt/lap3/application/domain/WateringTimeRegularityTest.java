package sem3pi.dei.isep.ipp.pt.lap3.application.domain;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringTimeRegularity;

import static org.junit.Assert.assertEquals;

public class WateringTimeRegularityTest {
    @Test
    public void assertWateringTimeRegularityIsInstantiated(){
        WateringTimeRegularity wateringTimeRegularity = new WateringTimeRegularity("T");
        assertEquals(wateringTimeRegularity, wateringTimeRegularity);
    }
}
