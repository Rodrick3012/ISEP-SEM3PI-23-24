package sem3pl.dei.isep.ipp.pt.esinf.application.domain;

import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;

import java.util.ArrayList;
import java.util.List;

public class InfoForUs08 {


private List<Edge<Locals,Integer>> listEdges;
private int totalDistance;
private int numeroCarregamentos;
private double tempoCircuito;
    public InfoForUs08(List<Edge<Locals,Integer>> listEdges,int totalDistance, int numeroCarregamenteos, double tempoCircuito){
           this.listEdges = listEdges;
           this.totalDistance = totalDistance;
           this.numeroCarregamentos = numeroCarregamenteos;
           this.tempoCircuito = tempoCircuito;
    }

    public List<Edge<Locals, Integer>> getListEdges() {
        return listEdges;
    }

    public int getTotalDistance() {
        return totalDistance;
    }

    public int getNumeroCarregamentos() {
        return numeroCarregamentos;
    }

    public double getTempoCircuito() {
        return tempoCircuito;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("InfoForUs08{\n");
        sb.append("  listEdges=[\n");

        for (Edge<Locals, Integer> edge : listEdges) {
            sb.append("    {");
            sb.append("vertex1=").append(edge.getVOrig());
            sb.append(", vertex2=").append(edge.getVDest());
            sb.append(", weight=").append(edge.getWeight());
            sb.append("},\n");
        }

        sb.append("  ],\n");
        sb.append("  totalDistance=").append(totalDistance).append(",\n");
        sb.append("  numeroCarregamentos=").append(numeroCarregamentos).append(",\n");
        sb.append("  tempoCircuito=").append(tempoCircuito).append("\n");
        sb.append("}");

        return sb.toString();
    }
}
