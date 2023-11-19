package sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController;

import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.OperationRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.Repositories;

import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

public class OperationsRegisterController {
    private OperationRepository operationRepository;

    public OperationsRegisterController (){
        getOperationRepository();
    }

    private OperationRepository getOperationRepository() {
        if (Objects.isNull(operationRepository)) {
            Repositories repositories = Repositories.getInstance();
            operationRepository = repositories.getOperationRepository();
        }
        return operationRepository;
    }

    public void operationRegister(int tipooperacao, Date data, int quantidade, int cultura, String parcela) throws SQLException {
        operationRepository.operationRegister(tipooperacao, data, quantidade, cultura, parcela);
    }
}