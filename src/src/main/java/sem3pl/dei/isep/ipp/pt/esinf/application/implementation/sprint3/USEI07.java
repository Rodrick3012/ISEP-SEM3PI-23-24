package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;


import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.LocationCriteria;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Algorithms;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI01;
import sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint2.USEI02;

import java.time.LocalTime;
import java.util.*;

public class USEI07 {


    public List<Edge<Locals, Integer>> us07_method(Graph<Locals, Integer> graph, Locals inicialVertex, List<Edge<Locals, Integer>> listEdgesFinal, List<Locals> hubs, LocalTime horaInicio, int velocidadeMedia, int tempoDescargaCabazes) {
        LinkedList<Locals> shortPath = new LinkedList<>();
        Integer totalDistance = 0;
        int numeroHubsVisitados = 0;
        Locals nextHub;
        Integer distance = 0;
        while (!hubs.isEmpty()) {
            hubs = ordenarVerticesDeAcordoComMaisIndicados(hubs, horaInicio, inicialVertex, graph, velocidadeMedia);

            nextHub = hubs.remove(0);


            distance = Algorithms.shortestPath(graph, inicialVertex, nextHub, Integer::compare, Integer::sum, 0, shortPath, Integer.MAX_VALUE);
            totalDistance += distance;
            horaInicio = calcularHorarioEstimadoChegada(horaInicio, distance.intValue(), velocidadeMedia);
            horaInicio = horaInicio.plusSeconds(tempoDescargaCabazes);

            listEdgesFinal.addAll(getEdgesFromPath(graph, shortPath));
            numeroHubsVisitados++;
            inicialVertex = nextHub;

        }

        return listEdgesFinal;
    }


    private LinkedList<Locals> ordenarVerticesDeAcordoComMaisIndicados(List<Locals> vertices, LocalTime horaAtual, Locals pontoAnterior, Graph<Locals, Integer> graph, int velocidadeMedia) {
        List<Locals> verticesAindaValidos = ordenarVerticesPorProximidade(vertices, horaAtual);
        LinkedList<Locals> verticesOrdenadosPorDistancia = ordenarPorDistancia(pontoAnterior, verticesAindaValidos, graph, horaAtual, velocidadeMedia);

        verticesOrdenadosPorDistancia.sort(new Comparator<Locals>() {
            @Override
            public int compare(Locals v1, Locals v2) {
                int distanciaV1 = v1.getOpeningTime().getHour();
                int distanciaV2 = v2.getOpeningTime().getHour();

                if (distanciaV1 != distanciaV2) {
                    return Integer.compare(distanciaV1, distanciaV2);
                } else {
                    // Se as horas de abertura são iguais, verificar a proximidade
                    int distanciaProximidadeV1 = calcularDistanciaProximidade(pontoAnterior, v1, graph);
                    int distanciaProximidadeV2 = calcularDistanciaProximidade(pontoAnterior, v2, graph);

                    return Integer.compare(distanciaProximidadeV1, distanciaProximidadeV2);
                }
            }
        });

        return verticesOrdenadosPorDistancia;
    }

    private static LinkedList<Locals> ordenarPorDistancia(Locals pontoAnterior, List<Locals> hubs, Graph<Locals, Integer> graph, LocalTime horaAtual, int velocidadeMedia) {
        LinkedList<Locals> hubsOrdenadosDistancia = new LinkedList<>(hubs);
        LinkedList<Locals> shortPath = new LinkedList<>();

        Iterator<Locals> iterator = hubsOrdenadosDistancia.iterator();
        while (iterator.hasNext()) {
            Locals hub = iterator.next();

            // Calcular distância estimada
            int distancia = Algorithms.shortestPath(graph, pontoAnterior, hub, Integer::compare, Integer::sum, 0, shortPath, Integer.MAX_VALUE);

            // Calcular horário estimado de chegada
            System.out.println(hub.getId());
            LocalTime chegadaEstimada = calcularHorarioEstimadoChegada(horaAtual, distancia, velocidadeMedia);

            // Remover se o horário de chegada ultrapassar o horário de fecho
            if (chegadaEstimada.isAfter(hub.getClosingTime())) {
                iterator.remove();
            }
        }

        // Ordenar a lista restante por distância
        hubsOrdenadosDistancia.sort(new Comparator<Locals>() {
            @Override
            public int compare(Locals hub1, Locals hub2) {
                int distanciaHub1 = Algorithms.shortestPath(graph, pontoAnterior, hub1, Integer::compare, Integer::sum, 0, shortPath, Integer.MAX_VALUE);
                int distanciaHub2 = Algorithms.shortestPath(graph, pontoAnterior, hub2, Integer::compare, Integer::sum, 0, shortPath, Integer.MAX_VALUE);
                return Integer.compare(distanciaHub1, distanciaHub2);
            }
        });

        return hubsOrdenadosDistancia;
    }

    public static List<Locals> ordenarVerticesPorProximidade(List<Locals> vertices, LocalTime horaAtual) {
        // Filtrar vértices que ainda estão abertos
        List<Locals> verticesAbertos = new ArrayList<>();
        for (Locals vertex : vertices) {
            if (vertex.getOpeningTime().isBefore(horaAtual) && vertex.getClosingTime().isAfter(horaAtual) || vertex.getOpeningTime().isAfter(horaAtual)) {
                verticesAbertos.add(vertex);
            }
        }
        return verticesAbertos;
    }

    public static List<Edge<Locals, Integer>> getEdgesFromPath(Graph<Locals, Integer> graph, List<Locals> pathLocals) {
        List<Edge<Locals, Integer>> edges = new ArrayList<>();

        for (int i = 0; i < pathLocals.size() - 1; i++) {
            Locals sourceVertex = pathLocals.get(i);
            Locals targetVertex = pathLocals.get(i + 1);
            Edge<Locals, Integer> edge = graph.edge(sourceVertex, targetVertex);
            if (edge != null) {
                edges.add(edge);
            }
        }

        return edges;
    }

    private static LocalTime calcularHorarioEstimadoChegada(LocalTime horaAtual, int distancia, int velocidadeMedia) {
        // Converter velocidade para metros por segundo
        double velocidadeMetrosPorSegundo = velocidadeMedia / 3.6;  // 1 km/h = 1/3.6 m/s

        // Calcular o tempo estimado em segundos
        int tempoEstimadoSegundos = (int) (distancia / velocidadeMetrosPorSegundo);

        // Adicionar o tempo estimado ao horário atual
        horaAtual = horaAtual.plusSeconds(tempoEstimadoSegundos);

        System.out.println(horaAtual);
        return horaAtual;
    }

    private int calcularDistanciaProximidade(Locals pontoAnterior, Locals local, Graph<Locals, Integer> graph) {
        // Implemente o cálculo real da proximidade, por exemplo, usando o algoritmo de Dijkstra
        // Retorne a distância estimada entre pontoAnterior e local
        return Algorithms.shortestPath(graph, pontoAnterior, local, Integer::compare, Integer::sum, 0, new LinkedList<>(), Integer.MAX_VALUE);
    }
}







