CREATE OR REPLACE TRIGGER trg_inserirCriacaoLog
AFTER INSERT ON operacao
FOR EACH ROW
BEGIN
insert into logoperacoes(idOperacao,dataAlteracao,tipoalteracao) values (:NEW.id,SYSDATE,1);
END;
