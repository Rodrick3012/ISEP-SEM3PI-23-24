package sem3pl.dei.isep.ipp.pt.lapr3.application.menus.operationsUI;

import sem3pl.dei.isep.ipp.pt.Main;
import sem3pl.dei.isep.ipp.pt.lapr3.application.FarmCoordinator;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.culturaController.CulturaController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.OperationsRegisterController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.TipoOperacaoController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.parcelaController.ParcelaController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Cultura;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Parcela;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.TipoOperacao;
import sem3pl.dei.isep.ipp.pt.lapr3.application.utils.Utils;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

public class OperationRegisterUI {
    private OperationsRegisterController operationsRegisterController;
    private ParcelaController parcelaController;
    private TipoOperacaoController tipoOperacaoController;
    private CulturaController culturaController;

    public OperationRegisterUI() {

        operationsRegisterController = new OperationsRegisterController();
        parcelaController = new ParcelaController();
        tipoOperacaoController = new TipoOperacaoController();
        culturaController = new CulturaController();

    }

    public void run(String tipoOperacao) {

        try {
            System.out.println("Register a new Operation");

            List<TipoOperacao> tipoOperacaoList= tipoOperacaoController.getTipoOpercao();

            int tipo=0;
            for (TipoOperacao tipoOper: tipoOperacaoList) {
                if (tipoOper.getTipooperacao().equalsIgnoreCase(tipoOperacao)){
                    tipo=tipoOper.getId();
                }
            }

            String format = "dd-MM-yyyy";
            Date date = Utils.readDate("Date",format);

            int quantity = Utils.readInt("Quantidade");

            List<Parcela> parcelas= parcelaController.getParcelas();
            String parcela = Utils.selectParcelaList("Escolha uma parcela",parcelas);


            List<Cultura> culturas= culturaController.getCulturasForParcela(parcela);
            if (culturas.isEmpty()){
                System.out.println("Não existe nenhuma cultura ativa na parcela selecionada");
            }else {
                int cultura = Utils.selectCulturaList("Escolha uma cultura",culturas);

                System.out.println();
                operationsRegisterController.operationRegister(tipo,date,quantity,cultura,parcela);
                System.out.println("\nOperation registered.");;
            }


        } catch (SQLException e ) {
            System.out.println("\nOperation not registered!\n" + e.getMessage());
        }

        FarmCoordinator farmCoordinator = new FarmCoordinator();
        farmCoordinator.run();
    }

}




