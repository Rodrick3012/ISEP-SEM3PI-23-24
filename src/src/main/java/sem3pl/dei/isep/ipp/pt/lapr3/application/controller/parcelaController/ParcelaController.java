package sem3pl.dei.isep.ipp.pt.lapr3.application.controller.parcelaController;

import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Parcela;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.ParcelaRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.Repositories;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class ParcelaController {
    private ParcelaRepository parcelaRepository;

    public ParcelaController(){
        getParcelaRepository();
    }

    private ParcelaRepository getParcelaRepository() {
        if (Objects.isNull(parcelaRepository)) {
            Repositories repositories = Repositories.getInstance();
            parcelaRepository = repositories.getParcelaRepository();
        }
        return parcelaRepository;
    }

    public List<Parcela> getParcelas() throws SQLException {
        return parcelaRepository.getParcela();
    }
}
