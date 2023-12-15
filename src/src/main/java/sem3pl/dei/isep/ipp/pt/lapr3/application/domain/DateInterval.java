package sem3pl.dei.isep.ipp.pt.lapr3.application.domain;

import java.util.Date;

public class DateInterval {
    private Date startDate;
    private Date endDate;
    private Integer fertigationMix;

    public DateInterval(Date startDate, Date endDate) {
        this.startDate = startDate;
        this.endDate = endDate;
        fertigationMix = null;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getFertigationMix(){
        return fertigationMix;
    }
    public void setFertigationMix(Integer fertigationMix){
        this.fertigationMix = fertigationMix;
    }
}
