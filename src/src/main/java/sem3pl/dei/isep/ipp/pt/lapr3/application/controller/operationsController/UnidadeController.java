package sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController;

import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Unidade;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.UnidadeRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.Repositories;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class UnidadeController {
    private UnidadeRepository UnidadeRepository;

    public UnidadeController(){
        getUnidadeRepository();
    }

    private UnidadeRepository getUnidadeRepository() {
        if (Objects.isNull(UnidadeRepository)) {
            Repositories repositories = Repositories.getInstance();
            UnidadeRepository = repositories.getUnidadeRepository();
        }
        return UnidadeRepository;
    }

    public List<Unidade> getUnidades() throws SQLException {
        return UnidadeRepository.getUnidade();
    }
}
