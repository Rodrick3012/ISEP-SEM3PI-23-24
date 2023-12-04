CREATE OR REPLACE TRIGGER trg_naoApagarOperacoes
BEFORE DELETE ON operacao
FOR EACH ROW
BEGIN
    raise_application_error(-20001, 'Operations can not be deleted');
END;
/
