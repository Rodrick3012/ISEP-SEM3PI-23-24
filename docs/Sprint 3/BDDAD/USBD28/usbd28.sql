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