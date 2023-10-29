package sem3pl.dei.isep.ipp.pt.lapr3.application.utils;

import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Watering;

import java.util.Comparator;

public class WateringComparator implements Comparator<Watering> {
    @Override
    public int compare(Watering o1, Watering o2){
        return o1.getAgriculturalParcelSector().compareTo(o2.getAgriculturalParcelSector());
    }
}
