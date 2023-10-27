package sem3pi.dei.isep.ipp.pt.lap3.application.domain;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.DateInterval;

import java.util.Calendar;
import java.util.Date;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class DateIntervalTest {
    @Test
    public void assertObjectIsInstantiated(){
        Calendar calendar1 = Calendar.getInstance();
        calendar1.set(2023, 10, 10);
        Date date1 = calendar1.getTime();
        calendar1.set(2023, 12, 12);
        Date date2 = calendar1.getTime();
        DateInterval dateInterval = new DateInterval(date1, date2);
        assertEquals(dateInterval, dateInterval);
    }

}
