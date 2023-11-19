package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import oracle.jdbc.OracleTypes;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Cultura;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CulturaRepository {

    public CulturaRepository() {
    }

    public List<Cultura> getCultura() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Cultura> Culturas = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call getCulturas() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            Culturas = resultSetToList(resultSet);
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if(!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return Culturas;
    }


    public List<Cultura> getCulturaForParcela(String parcela) throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Cultura> Culturas = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call getCulturaforParcela(?) }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);
            callStmt.setString(2, parcela);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            Culturas = resultSetToList(resultSet);
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if(!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return Culturas;
    }



    private List<Cultura> resultSetToList(ResultSet resultSet) throws SQLException {
        List<Cultura> Culturas = new ArrayList<>();
        while (true) {
            if (!resultSet.next()) break;
            Cultura Cultura = new Cultura(
                    resultSet.getInt("id"),
                    resultSet.getString("planta"),
                    resultSet.getDate("dataInicial"),
                    resultSet.getDate("dataFinal"),
                    resultSet.getInt("quantidade")
            );
            Culturas.add(Cultura);
        }
        return Culturas;
    }

}