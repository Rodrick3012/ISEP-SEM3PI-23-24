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

--teste com datas validas
DECLARE
result1 BOOLEAN;
BEGIN
    result1 := fncverificarDataNaoEstaNoFuturo(SYSDATE, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 1: ' || CASE WHEN result1 THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/


--teste com data no futuro
DECLARE
result1 BOOLEAN;
BEGIN
    result1 := fncverificarDataNaoEstaNoFuturo(SYSDATE, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 2: ' || CASE WHEN result1 THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

--teste com data inicial maior que data final
DECLARE
result1 BOOLEAN;
BEGIN
    result1 := fncverificarDataNaoEstaNoFuturo(SYSDATE, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Resultado do Teste 3: ' || CASE WHEN result1 THEN 'Sucesso' ELSE 'Falha' END);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/


