package sem3pi.dei.isep.ipp.pt.lap3.application.domain;

import org.junit.Test;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.DateInterval;

import java.util.Calendar;
import java.util.Date;

import static org.junit.Assert.*;

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

    @Test
    public void assertEqualsFunctionWorked(){
        Calendar calendar1 = Calendar.getInstance();
        calendar1.set(2023, 10, 10);
        Date date1 = calendar1.getTime();
        calendar1.set(2023, 12, 12);
        Date date2 = calendar1.getTime();
        DateInterval dateInterval = new DateInterval(date1, date2);
        assertTrue(dateInterval.equals(dateInterval));
    }

    @Test
    public void assertEqualsFunctionWorksIfTwoDatesIntervalAreDifferent(){
        Calendar calendar1 = Calendar.getInstance();
        calendar1.set(2023, 10, 10);
        Date date1 = calendar1.getTime();
        calendar1.set(2023, 12, 12);
        Date date2 = calendar1.getTime();
        DateInterval dateInterval = new DateInterval(date1, date2);
        Calendar calendar2 = Calendar.getInstance();
        calendar2.set(2023, 12, 10);
        Date date3 = calendar1.getTime();
        calendar2.set(2023, 11, 12);
        Date date4 = calendar1.getTime();
        DateInterval dateInterval1 = new DateInterval(date3, date4);
        assertFalse(dateInterval.equals(dateInterval1));
    }


}
