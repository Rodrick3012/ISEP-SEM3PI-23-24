package sem3pl.dei.isep.ipp.pt.esinf.application.implementation.sprint3;


import sem3pl.dei.isep.ipp.pt.esinf.application.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.application.domain.PathMaxHubs;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Algorithms;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Edge;
import sem3pl.dei.isep.ipp.pt.esinf.application.graph.Graph;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

public class USEI07 {

    public Map<String,Integer> us07_method(Graph<Locals, Integer> graph, Locals inicialVertex, List<Edge<Locals, Integer>> listEdgesFinal, List<Locals> hubs, LocalTime horaInicio, int velocidadeMedia, int tempoDescargaCabazes, List<PathMaxHubs> result) {
        LinkedList<Locals> shortPath = new LinkedList<>();
        List<Locals> hubsAux = hubs;
        LocalTime horaInicioAux = horaInicio;
        Locals nextHub;
        Integer distance;


        while (!hubs.isEmpty()) {
            hubs = ordenarVerticesDeAcordoComMaisIndicados(hubs, horaInicio, inicialVertex, graph, velocidadeMedia);
            if (!hubs.isEmpty()) {

                nextHub = hubs.remove(0);

                if (nextHub.getOpeningTime().isBefore(horaInicio)) {
                    distance = Algorithms.shortestPath(graph, inicialVertex, nextHub, Integer::compare, Integer::sum, 0, shortPath, Integer.MAX_VALUE);
                    horaInicio = calcularHorarioEstimadoChegada(horaInicio, distance.intValue(), velocidadeMedia);

                    horaInicio = horaInicio.plusSeconds(tempoDescargaCabazes);
                    listEdgesFinal.addAll(getEdgesFromPath(graph, shortPath));

                    inicialVertex = nextHub;
                }
            }

        }

        int distanciaTotal=0;
        LocalTime horaChegada = calcularHorarioEstimadoChegada(horaInicioAux,distanciaTotal,velocidadeMedia);
        LocalTime horaPartida = horaChegada.plusSeconds(tempoDescargaCabazes);
        for (Edge<Locals, Integer> i : listEdgesFinal) {
            distanciaTotal+=i.getWeight();

            if (hubsAux.contains(i.getVDest())) {
                if (!result.contains(new PathMaxHubs(i.getVOrig(),true,horaChegada,horaPartida))) {
                    result.add(new PathMaxHubs(i.getVOrig(),true,horaChegada,horaPartida));
                }
                if (!result.contains(new PathMaxHubs(i.getVDest(),true,horaChegada,horaPartida))) {
                    result.add(new PathMaxHubs(i.getVDest(),true,horaChegada,horaPartida));
                }
            } else {
                if (!result.contains(new PathMaxHubs(i.getVOrig(),false,horaChegada,null))) {
                    result.add(new PathMaxHubs(i.getVOrig(),false,horaChegada,null));
                }
                if (!result.contains(new PathMaxHubs(i.getVDest(),false,horaChegada,null))) {
                    result.add(new PathMaxHubs(i.getVDest(),false,horaChegada,null));
                }
            }
            horaChegada = calcularHorarioEstimadoChegada(horaInicioAux,distanciaTotal,velocidadeMedia);
            horaPartida = horaChegada.plusSeconds(tempoDescargaCabazes);
        }

        Map<String,Integer> statReturn = new HashMap<>();
        statReturn.put("distanciaTotal",distanciaTotal);
        statReturn.put("carregamentos",null);


        LocalDateTime startDateTime = LocalDateTime.of(LocalDate.now(), horaInicioAux);
        LocalDateTime endDateTime =     LocalDateTime.of(LocalDate.now(), horaChegada);

        Duration duration = Duration.between(startDateTime, endDateTime);

        long diffInSeconds = duration.getSeconds();

        statReturn.put("tempo total", (int) diffInSeconds);
        return  statReturn;
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

        return horaAtual;
    }

    private int calcularDistanciaProximidade(Locals pontoAnterior, Locals local, Graph<Locals, Integer> graph) {
        // Retorne a distância estimada entre pontoAnterior e local
        return Algorithms.shortestPath(graph, pontoAnterior, local, Integer::compare, Integer::sum, 0, new LinkedList<>(), Integer.MAX_VALUE);
    }
}







