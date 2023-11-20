package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private OperationRepository operationRepository = null;

    private ParcelaRepository parcelaRepository = null;

    private TipoOperacaoRepository tipoOperacaoRepository = null;

    private CulturaRepository culturaRepository = null;


    private FatorProducaoRepository fatorProducaoRepository = null;

    private OperacaoFatorProducaoRepository operacaoFatorProducaoRepository = null;

    private UnidadeRepository unidadeRepository = null;


    private Repositories() {

        operationRepository = new OperationRepository();
        parcelaRepository = new ParcelaRepository();
        tipoOperacaoRepository= new TipoOperacaoRepository();
        culturaRepository= new CulturaRepository();
        fatorProducaoRepository = new FatorProducaoRepository();
        operacaoFatorProducaoRepository= new OperacaoFatorProducaoRepository();
        unidadeRepository = new UnidadeRepository();
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
    public CulturaRepository getCulturaRepository() {
        return culturaRepository;
    }


    public FatorProducaoRepository getFatorProducaoRepository() {
        return fatorProducaoRepository;
    }
    public OperacaoFatorProducaoRepository getOperacaoFatorProducaoRepository() {
        return operacaoFatorProducaoRepository;
    }

    public UnidadeRepository getUnidadeRepository(){
        return unidadeRepository;
    }
}
