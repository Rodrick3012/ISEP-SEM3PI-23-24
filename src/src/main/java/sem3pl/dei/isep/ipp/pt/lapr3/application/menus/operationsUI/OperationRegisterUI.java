package sem3pl.dei.isep.ipp.pt.lapr3.application.menus.operationsUI;

import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.culturaController.CulturaController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.OperationsRegisterController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.TipoOperacaoController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.UnidadeController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.parcelaController.ParcelaController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Cultura;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Parcela;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.TipoOperacao;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Unidade;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Utils;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class OperationRegisterUI {
    private OperationsRegisterController operationsRegisterController;
    private ParcelaController parcelaController;
    private TipoOperacaoController tipoOperacaoController;
    private CulturaController culturaController;
    private UnidadeController unidadeController;


    public OperationRegisterUI() {
        operationsRegisterController = new OperationsRegisterController();
        parcelaController = new ParcelaController();
        tipoOperacaoController = new TipoOperacaoController();
        culturaController = new CulturaController();
        unidadeController = new UnidadeController();
    }

    public void run(String tipoOperacao) {
        try {
            System.out.println("Register a new Operation");

            List<TipoOperacao> tipoOperacaoList = tipoOperacaoController.getTipoOperacao();

            int tipo = 0;
            for (TipoOperacao tipoOper : tipoOperacaoList) {
                if (tipoOper.getTipooperacao().equalsIgnoreCase(tipoOperacao)) {
                    tipo = tipoOper.getId();
                }
            }
            String format = "dd-MM-yyyy";
            Date date = Utils.readDate("Date", format);

            double quantity = Utils.readDouble("Quantity");

            List<Unidade> unidades = unidadeController.getUnidades();
            int unidade = Utils.selectUnidades("Choose the unity",unidades);

            List<Parcela> parcelas = parcelaController.getParcelas();
            String parcela = Utils.selectParcelaList("Choose a parcel", parcelas);

            List<Cultura> culturas = culturaController.getCulturasForParcela(parcela);
            if (culturas.isEmpty()) {
                System.out.println("There are no active cultures in the selected parcel.");
            } else {
                int cultura = Utils.selectCulturaList("Choose a culture", culturas);

                System.out.println();
                operationsRegisterController.operationRegister(tipo, date, quantity, cultura, parcela,unidade);

            }

        } catch (SQLException ignored) {

        }

        FarmCoordinator farmCoordinator = new FarmCoordinator();
        farmCoordinator.run();
    }
}
