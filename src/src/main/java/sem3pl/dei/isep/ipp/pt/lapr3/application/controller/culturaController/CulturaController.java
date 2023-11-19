package sem3pl.dei.isep.ipp.pt.lapr3.application.controller.culturaController;

import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Cultura;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.CulturaRepository;
import sem3pl.dei.isep.ipp.pt.lapr3.application.repository.Repositories;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class CulturaController {
    private CulturaRepository CulturaRepository;

    public CulturaController(){
        getCulturaRepository();
    }

    private CulturaRepository getCulturaRepository() {
        if (Objects.isNull(CulturaRepository)) {
            Repositories repositories = Repositories.getInstance();
            CulturaRepository = repositories.getCulturaRepository();
        }
        return CulturaRepository;
    }

    public List<Cultura> getCulturas() throws SQLException {
        return CulturaRepository.getCultura();
    }

    public List<Cultura> getCulturasForParcela(String parcela) throws SQLException {
        return CulturaRepository.getCulturaForParcela(parcela);
    }
}
