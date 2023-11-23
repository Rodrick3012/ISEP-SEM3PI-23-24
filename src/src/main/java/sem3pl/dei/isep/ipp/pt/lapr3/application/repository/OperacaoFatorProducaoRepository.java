package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.OperacaoFatorProducao;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.DbmsOutput;

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
            callStmt = connection.prepareCall("{ call inserirOperacaoAplicacaoFatorProducao(?,?,?,?,?,?,?,?,?) }");

            java.util.Date currentDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
            callStmt.setDate(1,sqlDate);
            Date sqlDate1 = new Date(data.getTime());
            callStmt.setDate(2, sqlDate1);
            callStmt.setInt(3, quantidade);
            callStmt.setString(4, parcela);
            callStmt.setString(5, fatorproducao);
            callStmt.setInt(6, cultura);
            callStmt.setInt(7, tipooperacao);
            callStmt.setInt(8, unidade);
            callStmt.registerOutParameter(9, java.sql.Types.INTEGER); // Register the OUT parameter for ID

            System.out.println(sqlDate);
            System.out.println(sqlDate1);
            System.out.println(quantidade);
            System.out.println(parcela);
            System.out.println(fatorproducao);
            System.out.println(cultura);
            System.out.println(tipooperacao);
            System.out.println(unidade);
            System.out.println(java.sql.Types.INTEGER);

            DbmsOutput dbmsOutput = new DbmsOutput(connection);
            dbmsOutput.enable(1000000);


            callStmt.execute();
            dbmsOutput.show();
            dbmsOutput.close();
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
