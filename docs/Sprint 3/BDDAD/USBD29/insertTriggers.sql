CREATE OR REPLACE TRIGGER trg_inserirCriacaoLog
    AFTER INSERT ON operacao
    FOR EACH ROW
BEGIN
insert into logoperacoes(idOperacao,estadoAnulacaoAnterior,dataOperacao,dataAlteracao,tipoAlteracao) values
    (:NEW.id,:NEW.anulada,:NEW.data,SYSDATE,1);
END;
/
CREATE OR REPLACE TRIGGER setIdNext
BEFORE INSERT ON Operacao
FOR EACH ROW
DECLARE
oldID number;
    newID number;
BEGIN
SELECT NVL(MAX(ID), 0) INTO oldId FROM operacao;
newID := oldId + 1;
    :NEW.ID := newID;
END;
/

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
/
create or replace trigger trg_ProibidoAlterarApagarLogs
before update or delete
       on logoperacoes
declare
proibidoAlterarApagarLogs exception;
begin
    raise proibidoAlterarApagarLogs;
exception
    when proibidoAlterarApagarLogs then
        raise_application_error(-20001, 'Não é possível alterar ou apagar as logs');
end;
/
CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesMonda
BEFORE DELETE ON Monda
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/
CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesColheita
BEFORE DELETE ON Colheita
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/
CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesSemeadura
BEFORE DELETE ON Semeadura
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/

CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesPlantacao
BEFORE DELETE ON Plantacao
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/

CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesMobilizacaoSolo
BEFORE DELETE ON MobilizacaoSolo
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/

CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesIncorporacaoSolo
BEFORE DELETE ON IncorporacaoSolo
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/

CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesPoda
BEFORE DELETE ON Poda
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/
CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesRega
BEFORE DELETE ON OperacaoRegaSetor
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/
CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesFatorProducao
BEFORE DELETE ON operacaoFatorProducao
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/
CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesFertilizacao
BEFORE DELETE ON operacaoFertilizacao
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/

CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesFertilizacao
BEFORE DELETE ON operacaoFertilizacao
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/
CREATE OR REPLACE TRIGGER trg_naoApagarOperacoesAplicacao
BEFORE DELETE ON operacaoAplicacao
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/

CREATE OR REPLACE TRIGGER trg_naoApagarOperacoes
BEFORE DELETE ON operacao
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/