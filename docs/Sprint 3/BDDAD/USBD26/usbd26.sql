CREATE OR REPLACE TRIGGER trg_inserirCriacaoLog
    AFTER INSERT OR UPDATE ON operacao
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO logoperacoes(idOperacao, estadoAnulacaoAnterior, dataOperacao, dataAlteracao, tipoAlteracao)
        VALUES (:NEW.id, :NEW.anulada, :NEW.data, SYSDATE, 1);
    ELSIF UPDATING THEN
        INSERT INTO logoperacoes(idOperacao, estadoAnulacaoAnterior, dataOperacao, dataAlteracao, tipoAlteracao)
        VALUES (:OLD.id, :OLD.anulada, :OLD.data, SYSDATE, 2);
    END IF;
END;