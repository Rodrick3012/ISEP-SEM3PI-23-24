package sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController;

import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.OperacaoFatorProducaoRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.Repositories;

import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

public class OperationFatorProducaoRegisterController {
    private OperacaoFatorProducaoRepository operacaoFatorProducaoRepository;


    public OperationFatorProducaoRegisterController(){
        getOperationFatorProducaoRepository();
    }

    private OperacaoFatorProducaoRepository getOperationFatorProducaoRepository() {
        if (Objects.isNull(operacaoFatorProducaoRepository)) {
            Repositories repositories = Repositories.getInstance();
            operacaoFatorProducaoRepository = repositories.getOperacaoFatorProducaoRepository();
        }
        return operacaoFatorProducaoRepository;
    }

    public void operationFatorProducaoRegister(int tipooperacao, Date data, int quantidade, int cultura, String parcela,String fatorproducao) throws SQLException {
        operacaoFatorProducaoRepository.OperacaoFatorProducaoRegister(tipooperacao, data, quantidade, cultura, parcela,fatorproducao);
    }
}

