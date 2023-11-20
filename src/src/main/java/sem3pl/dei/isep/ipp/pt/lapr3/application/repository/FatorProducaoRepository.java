package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import oracle.jdbc.OracleTypes;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.FatorProducao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class FatorProducaoRepository {

    public FatorProducaoRepository() {
    }

    public List<FatorProducao> getFatorProducao() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<FatorProducao> FatorProducaoList = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call getfatorproducao() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            FatorProducaoList = resultSetToList(resultSet);
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if(!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return FatorProducaoList;
    }




    private List<FatorProducao> resultSetToList(ResultSet resultSet) throws SQLException {
        List<FatorProducao> FatorProducaoList = new ArrayList<>();
        while (true) {
            if (!resultSet.next()) break;
            FatorProducao tipo = new FatorProducao(
                    resultSet.getString("designacao"),
                    resultSet.getInt("fabricante"),
                    resultSet.getInt("formulacao"),
                    resultSet.getInt("classificacao"),
                    resultSet.getInt("objetivo"),
                    resultSet.getInt("ph")

            );
            FatorProducaoList.add(tipo);
        }
        return FatorProducaoList;
    }

}