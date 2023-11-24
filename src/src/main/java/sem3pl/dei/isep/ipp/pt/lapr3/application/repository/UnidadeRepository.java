package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import oracle.jdbc.OracleTypes;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Unidade;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class UnidadeRepository {

    public UnidadeRepository() {
    }

    public List<Unidade> getUnidade() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Unidade> UnidadeList = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncgetUnidade() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            UnidadeList = resultSetToList(resultSet);
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if(!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return UnidadeList;
    }




    private List<Unidade> resultSetToList(ResultSet resultSet) throws SQLException {
        List<Unidade> tipooperacoes = new ArrayList<>();
        while (true) {
            if (!resultSet.next()) break;
            Unidade Unidade = new Unidade(
                    resultSet.getInt("id"),
                    resultSet.getString("Unidade")
            );
            tipooperacoes.add(Unidade);
        }
        return tipooperacoes;
    }

}