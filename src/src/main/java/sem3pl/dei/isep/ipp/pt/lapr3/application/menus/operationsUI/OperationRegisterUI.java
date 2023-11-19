package sem3pl.dei.isep.ipp.pt.lapr3.application.menus.operationsUI;

import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.OperationsRegisterController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.operationsController.TipoOperacaoController;
import sem3pl.dei.isep.ipp.pt.lapr3.application.controller.parcelaController.ParcelaController;
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

    public OperationRegisterUI() {

        operationsRegisterController = new OperationsRegisterController();
        parcelaController = new ParcelaController();
        tipoOperacaoController = new TipoOperacaoController();
    }

    public void run() {

        try {
            System.out.println("Register a new Operation");

            List<TipoOperacao> tipoOperacaoList= tipoOperacaoController.getTipoOpercao();
            int tipo  = Utils.selectTipoOperacaoList("Escolha um tipo de operação",tipoOperacaoList);

            String format = "dd-MM-yyyy";
            Date date = Utils.readDate("Date",format);
            int quantity = Utils.readInt("Quantidade");
            List<Parcela> parcelas= parcelaController.getParcelas();
            String parcela = Utils.selectParcelaList("Escolha uma parcela",parcelas);
            int cultura =  Utils.readInt("Cultura");


            operationsRegisterController.operationRegister(tipo,date,quantity,cultura,parcela);
            System.out.println("\nOperation registered.");;


        } catch (SQLException e ) {
            System.out.println("\nOperation not registered!\n" + e.getMessage());
        }


    }

}




