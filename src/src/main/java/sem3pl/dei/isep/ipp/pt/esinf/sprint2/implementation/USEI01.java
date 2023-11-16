package sem3pl.dei.isep.ipp.pt.esinf.sprint2.implementation;

import sem3pl.dei.isep.ipp.pt.esinf.sprint2.domain.Locals;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.CommonGraph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.Graph;
import sem3pl.dei.isep.ipp.pt.esinf.sprint2.graph.matrix.MatrixGraph;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class USEI01 {

    public CommonGraph<Locals, Integer> readToGraph(){
        CommonGraph<Locals, Integer> rede = new MatrixGraph<>(false);
        readVerticesGraph(rede);
        readEdgesGraph(rede);
        return  rede;
    }

    private void readVerticesGraph(CommonGraph<Locals, Integer> rede ){

        try (BufferedReader br = new BufferedReader(new FileReader("src/main/resources/locais_big.csv"))) {
            br.readLine();
            String linha;
            while ((linha = br.readLine()) != null) {
                String[] partes = linha.split(",");
                Locals local = new Locals(partes[0],partes[1],partes[2]);

                if (!rede.validVertex(local)) {
                    rede.addVertex(local);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    private void readEdgesGraph(CommonGraph<Locals, Integer> rede ){

        try (BufferedReader br = new BufferedReader(new FileReader("src/main/resources/distancias_big.csv"))) {
            br.readLine();
            String linha;
            while ((linha = br.readLine()) != null) {
                String[] partes = linha.split(",");


                Locals local1 = rede.getVertexByLocalsID(partes[0]);
                Locals local2 = rede.getVertexByLocalsID(partes[1]);
                Integer distance = Integer.parseInt(partes[2]);

                rede.addEdge(local1,local2,distance);
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

}
