package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import java.util.Objects;

public class Locals {
    private String id;
    private double latitude;
    private double longitude;

    public Locals(String id, double latitude, double longitude) {
        this.id = id;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public Locals(String id, String latitude, String longitude) {
        this.id =id;
        this.latitude = Double.parseDouble(latitude);
        this.longitude = Double.parseDouble(longitude);
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
        return Double.compare(locals.latitude, latitude) == 0 && Double.compare(locals.longitude, longitude) == 0 && Objects.equals(id, locals.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, latitude, longitude);
    }

    public String toString(){
        return String.format(id);
    }
}
