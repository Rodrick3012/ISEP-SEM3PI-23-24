package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import java.time.LocalTime;
import java.util.Objects;

public class Locals {
    private String id;
    private double latitude;
    private double longitude;
    private LocalTime openingTime;
    private LocalTime closingTime;

    public Locals(String id, double latitude, double longitude) {
        this.id = id;
        this.latitude = latitude;
        this.longitude = longitude;
        int numberPart = Integer.parseInt(id.substring(2)); // Extracting the number part from ID
        if (numberPart >= 1 && numberPart <= 105) {
            this.setOpeningTime(LocalTime.of(9, 0));
            this.setClosingTime(LocalTime.of(14, 0));
        } else if (numberPart >= 106 && numberPart <= 215) {
            this.setOpeningTime(LocalTime.of(11, 0));
            this.setClosingTime(LocalTime.of(16, 0));
        } else if (numberPart >= 216 && numberPart <= 323) {
            this.setOpeningTime(LocalTime.of(12, 0));
            this.setClosingTime(LocalTime.of(17, 0));
        }
    }

    public Locals(String id, String latitude, String longitude) {
        this.id = id;
        this.latitude = Double.parseDouble(latitude);
        this.longitude = Double.parseDouble(longitude);

        int numberPart = Integer.parseInt(id.substring(2)); // Extracting the number part from ID
        if (numberPart >= 1 && numberPart <= 105) {
            this.setOpeningTime(LocalTime.of(9, 0));
            this.setClosingTime(LocalTime.of(14, 0));
        } else if (numberPart >= 106 && numberPart <= 215) {
            this.setOpeningTime(LocalTime.of(11, 0));
            this.setClosingTime(LocalTime.of(16, 0));
        } else if (numberPart >= 216 && numberPart <= 323) {
            this.setOpeningTime(LocalTime.of(12, 0));
            this.setClosingTime(LocalTime.of(17, 0));
        }
    }
    public Locals(String id){
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public boolean isId(String id){
        return this.id.equalsIgnoreCase(id);
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Locals locals = (Locals) o;
        return Objects.equals(id, locals.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public String toString(){
        return String.format(id);
    }

    public LocalTime getOpeningTime() {
        return openingTime;
    }

    public LocalTime getClosingTime() {
        return closingTime;
    }

    public void setOpeningTime(LocalTime openingTime) {
        this.openingTime = openingTime;
    }

    public void setClosingTime(LocalTime closingTime) {
        this.closingTime = closingTime;
    }


    public void setTime(LocalTime openingTime,LocalTime closingTime) {
        this.openingTime = openingTime;
        this.closingTime = closingTime;
    }
}
