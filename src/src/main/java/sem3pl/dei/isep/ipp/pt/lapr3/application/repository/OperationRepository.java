package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import oracle.jdbc.internal.OracleCallableStatement;
import oracle.jdbc.internal.OracleTypes;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Operation;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.DbmsOutput;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

public class OperationRepository {

    public OperationRepository() {
    }


    public void operationRegister(int tipooperacao, java.util.Date data, int quantidade, int cultura, String parcela,int unidade) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call pcdinserirOperacao(?,?,?,?,?,?,?) }");

            java.util.Date currentDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
            callStmt.setDate(1,sqlDate);
            callStmt.setInt(2, tipooperacao);
            java.sql.Date sqlDate1 = new java.sql.Date(data.getTime());
            callStmt.setDate(3, sqlDate1);
            callStmt.setInt(4, quantidade);
            callStmt.setInt(5, cultura);
            callStmt.setString(6, parcela);
            callStmt.setInt(7, unidade);


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
                    resultSet.getString("parcela"),
                    resultSet.getInt("unidade")

            );
            operations.add(operacao);
        }
        return operations;
    }



}
