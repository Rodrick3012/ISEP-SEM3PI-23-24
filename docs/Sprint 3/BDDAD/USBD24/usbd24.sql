CREATE OR REPLACE TRIGGER trg_inserirCriacaoLog
    AFTER INSERT ON operacao
    FOR EACH ROW
BEGIN
insert into logoperacoes(idOperacao,estadoAnulacaoAnterior,dataOperacao,dataAlteracao,tipoAlteracao) values
    (:NEW.id,:NEW.anulada,:NEW.data,SYSDATE,1);
END;

