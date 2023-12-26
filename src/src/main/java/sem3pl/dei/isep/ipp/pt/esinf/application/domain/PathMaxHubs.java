package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import java.sql.Timestamp;
import java.time.LocalTime;
import java.util.Objects;

public class PathMaxHubs {
    Locals locais;
    Boolean isHub;

    LocalTime chegada;
    LocalTime partida;

    public PathMaxHubs(Locals locais, Boolean isHub, LocalTime chegada, LocalTime partida) {
        this.locais = locais;
        this.isHub = isHub;
        this.chegada = chegada;
        this.partida = partida;
    }

    public Locals getLocais() {
        return locais;
    }

    public void setLocais(Locals locais) {
        this.locais = locais;
    }

    public Boolean getHub() {
        return isHub;
    }

    public void setHub(Boolean hub) {
        isHub = hub;
    }

    public LocalTime getChegada() {
        return chegada;
    }

    public void setChegada(LocalTime chegada) {
        this.chegada = chegada;
    }

    public LocalTime getPartida() {
        return partida;
    }

    public void setPartida(LocalTime partida) {
        this.partida = partida;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PathMaxHubs that = (PathMaxHubs) o;
        return Objects.equals(locais, that.locais);
    }

    @Override
    public int hashCode() {
        return Objects.hash(locais, isHub, chegada, partida);
    }
}
