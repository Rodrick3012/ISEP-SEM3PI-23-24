package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private OperationRepository operationRepository = null;

    private ParcelaRepository parcelaRepository = null;

    private TipoOperacaoRepository tipoOperacaoRepository = null;

    private Repositories() {

        operationRepository = new OperationRepository();
        parcelaRepository = new ParcelaRepository();
        tipoOperacaoRepository= new TipoOperacaoRepository();
    }


    public static Repositories getInstance() {
        return instance;
    }

    public OperationRepository getOperationRepository() {
        return operationRepository;
    }

    public ParcelaRepository getParcelaRepository() {
        return parcelaRepository;
    }
    public TipoOperacaoRepository getTipoOperacaoRepository() {
        return tipoOperacaoRepository;
    }

}
