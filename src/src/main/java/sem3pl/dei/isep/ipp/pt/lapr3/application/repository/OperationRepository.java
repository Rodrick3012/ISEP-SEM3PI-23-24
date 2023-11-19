package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import oracle.jdbc.internal.OracleCallableStatement;
import oracle.jdbc.internal.OracleTypes;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Operation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class OperationRepository {

    public OperationRepository() {
    }

    public List<Operation> getOperations() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Operation> operations = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncSailors() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            operations = resultSetToList(resultSet);
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if(!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return operations;
    }

    public void operationRegister(int tipooperacao, java.util.Date data, int quantidade, int cultura, String parcela) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call inserirOperacao(?,?,?,?,?) }");

            callStmt.setInt(1, tipooperacao);
            java.sql.Date sqlDate = new java.sql.Date(data.getTime());
            callStmt.setDate(2, sqlDate);
            callStmt.setInt(3, quantidade);
            callStmt.setInt(4, cultura);
            callStmt.setString(5, parcela);

            callStmt.execute();
            connection.commit();
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }



    private List<Operation> resultSetToList(ResultSet resultSet) throws SQLException {
        List<Operation> operations = new ArrayList<>();
        while (true) {
            if (!resultSet.next()) break;
            Operation operacao = new Operation(
                    resultSet.getInt("id"),
                    resultSet.getInt("tipooperacao"),
                    resultSet.getDate("data"),
                    resultSet.getInt("quantidade"),
                    resultSet.getInt("cultura"),
                    resultSet.getString("parcela")
            );
            operations.add(operacao);
        }
        return operations;
    }



}
