--funcao validacao data/datas
create or replace NONEDITIONABLE FUNCTION fncverificarDataNaoEstaNoFuturo(dataAtual date,data1 date,
                                                                          data2 date DEFAULT NULL)
    RETURN BOOLEAN
    IS
    var_boolean BOOLEAN;
BEGIN

    IF data1 <= dataAtual AND (data2 IS NULL OR data1 <= data2) THEN
        var_boolean := TRUE;
    ELSE
        raise_application_error(-20001, 'Data inválida');
    END IF;

    RETURN var_boolean;
END;


