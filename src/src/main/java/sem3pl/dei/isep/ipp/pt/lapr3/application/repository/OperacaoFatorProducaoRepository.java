package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.OperacaoFatorProducao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class OperacaoFatorProducaoRepository {

    public OperacaoFatorProducaoRepository() {
    }


    public void OperacaoFatorProducaoRegister(int tipooperacao, java.util.Date data, int quantidade, int cultura, String parcela,String fatorproducao, int unidade) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call inserirOperacaoAplicacaoFatorProducao(?,?,?,?,?,?,?) }");

            Date sqlDate = new Date(data.getTime());
            callStmt.setDate(1, sqlDate);
            callStmt.setInt(2, quantidade);
            callStmt.setString(3, parcela);
            callStmt.setString(4, fatorproducao);
            callStmt.setInt(5, cultura);
            callStmt.setInt(6, tipooperacao);
            callStmt.setInt(7, unidade);


            callStmt.execute();
            connection.commit();
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }



    private List<OperacaoFatorProducao> resultSetToList(ResultSet resultSet) throws SQLException {
        List<OperacaoFatorProducao> OperacaoFatorProducaos = new ArrayList<>();
        while (true) {
            if (!resultSet.next()) break;
            OperacaoFatorProducao operacao = new OperacaoFatorProducao(
                    resultSet.getInt("id"),
                    resultSet.getDate("data"),
                    resultSet.getInt("quantidade"),
                    resultSet.getString("parcela"),
                    resultSet.getInt("modo"),
                    resultSet.getString("fatorproducao"),
                    resultSet.getInt("cultura"),
                    resultSet.getInt("tipooperacao")

            );
            OperacaoFatorProducaos.add(operacao);
        }
        return OperacaoFatorProducaos;
    }



}
