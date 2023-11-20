package sem3pl.dei.isep.ipp.pt.lapr3.application.controller.FatorProducaoController;

import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.FatorProducao;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.FatorProducaoRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.Repositories;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class FatorProducaoController {
    private FatorProducaoRepository FatorProducaoRepository;

    public FatorProducaoController(){
        getFatorProducaoRepository();
    }

    private FatorProducaoRepository getFatorProducaoRepository() {
        if (Objects.isNull(FatorProducaoRepository)) {
            Repositories repositories = Repositories.getInstance();
            FatorProducaoRepository = repositories.getFatorProducaoRepository();
        }
        return FatorProducaoRepository;
    }

    public List<FatorProducao> getFatorProducao() throws SQLException {
        return FatorProducaoRepository.getFatorProducao();
    }

}
