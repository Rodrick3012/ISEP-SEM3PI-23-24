package sem3pl.dei.isep.ipp.pt.lapr3.application.menus.operationsUI;

import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.culturaController.CulturaController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.OperationFatorProducaoRegisterController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.OperationsRegisterController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.TipoOperacaoController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.UnidadeController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.parcelaController.ParcelaController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.FatorProducaoController.FatorProducaoController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.*;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Utils;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class OperationFatorProducaoRegisterUI {
    private OperationsRegisterController operationsRegisterController;
    private OperationFatorProducaoRegisterController operationFatorProducaoRegisterController;

    private ParcelaController parcelaController;
    private TipoOperacaoController tipoOperacaoController;
    private CulturaController culturaController;

    private FatorProducaoController fatorProducaoController;
    private UnidadeController unidadeController;


    public OperationFatorProducaoRegisterUI() {

        operationsRegisterController = new OperationsRegisterController();
        parcelaController = new ParcelaController();
        tipoOperacaoController = new TipoOperacaoController();
        culturaController = new CulturaController();
        fatorProducaoController = new FatorProducaoController();
        operationFatorProducaoRegisterController = new OperationFatorProducaoRegisterController();
        unidadeController = new UnidadeController();
    }

    public void run(String tipoOperacao) {

        try {
            System.out.println("Register a new Operation");

            List<TipoOperacao> tipoOperacaoList= tipoOperacaoController.getTipoOperacao();

            int tipo=0;
            for (TipoOperacao tipoOper: tipoOperacaoList) {
                if (tipoOper.getTipooperacao().equalsIgnoreCase(tipoOperacao)){
                    tipo=tipoOper.getId();
                }
            }

            String format = "dd-MM-yyyy";
            Date date = Utils.readDate("Date",format);

            int quantity = Utils.readInt("Quantity");

            List<Unidade> unidades = unidadeController.getUnidades();
            int unidade = Utils.selectUnidades("Choose the unity",unidades);


            List<Parcela> parcelas= parcelaController.getParcelas();
            String parcela = Utils.selectParcelaList("Choose a parcel",parcelas);


            List<Cultura> culturas= culturaController.getCulturasForParcela(parcela);
            int cultura=0;
            if (!culturas.isEmpty()){
                cultura = Utils.selectCulturaListWithNull("Choose a culture",culturas);
            }


            List<FatorProducao> fatorProducaoList = fatorProducaoController.getFatorProducao();
            String fatorProducao = Utils.selectFatorProducaoList("Choose the production factor",fatorProducaoList);


            operationFatorProducaoRegisterController.operationFatorProducaoRegister(tipo,date,quantity,cultura,parcela,fatorProducao,unidade);




        } catch (SQLException ignored) {
        }

        FarmCoordinator farmCoordinator = new FarmCoordinator();
        farmCoordinator.run();
    }

}
