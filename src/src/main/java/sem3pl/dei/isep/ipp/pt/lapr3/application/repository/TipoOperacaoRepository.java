package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import oracle.jdbc.OracleTypes;
import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Parcela;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.TipoOperacao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class TipoOperacaoRepository {

    public TipoOperacaoRepository() {
    }

    public List<TipoOperacao> getTipoOperacao() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<TipoOperacao> tipoOperacaoList = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call gettipoopercao() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            tipoOperacaoList = resultSetToList(resultSet);
        } finally {
            if(!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if(!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return tipoOperacaoList;
    }




    private List<TipoOperacao> resultSetToList(ResultSet resultSet) throws SQLException {
        List<TipoOperacao> tipoOperacaoList = new ArrayList<>();
        while (true) {
            if (!resultSet.next()) break;
            TipoOperacao tipo = new TipoOperacao(
                    resultSet.getInt("id"),
                    resultSet.getString("tipooperacao")
            );
            tipoOperacaoList.add(tipo);
        }
        return tipoOperacaoList;
    }

}