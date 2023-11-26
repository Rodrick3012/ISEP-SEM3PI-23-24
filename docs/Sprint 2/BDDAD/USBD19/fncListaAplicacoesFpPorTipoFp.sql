create or replace FUNCTION fncListaAplicacoesFpPorTipoFp(
      pdataInicial operacaoFatorProducao.data%type
    , pdataFinal operacaoFatorProducao.data%type
    , p_parcela parcela.designacao%type) RETURN SYS_REFCURSOR
IS
  cursor1 SYS_REFCURSOR;
BEGIN
OPEN cursor1 FOR
SELECT
    classificacao.classificacao AS tipo_fator_producao,
    fatorProducao.designacao,
    NVL(cultura.planta, 'Sem cultura') AS cultura
FROM operacaoFatorProducao
         INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         INNER JOIN classificacao ON classificacao.id = fatorProducao.classificacao
         LEFT JOIN culturaoperacaofatorproducao cofp on cofp.operacaofatorproducao=operacaofatorproducao.id
         LEFT JOIN cultura ON cultura.id = cofp.cultura
WHERE
    operacaoFatorProducao.data BETWEEN pdataInicial AND pdataFinal AND parcela = p_parcela
ORDER BY operacaoFatorProducao.data;
RETURN cursor1;
END;
/


-- bloco anonimo
DECLARE
v_cursor SYS_REFCURSOR;
    v_tipo_fator_producao classificacao.classificacao%TYPE;
    v_designacao fatorProducao.designacao%TYPE;
    v_cultura cultura.planta%TYPE;
BEGIN
    v_cursor := fncListaAplicacoesFpPorTipoFp(
        TO_DATE('2019-01-04', 'YYYY-MM-DD'), -- Replace with your actual start date
        TO_DATE('2023-07-06', 'YYYY-MM-DD'),  -- Replace with your actual end date
        'Lameiro do moinho'
    );

    LOOP
BEGIN
FETCH v_cursor INTO v_tipo_fator_producao, v_designacao, v_cultura;
EXIT WHEN v_cursor%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('Tipo Fator Producao: ' || v_tipo_fator_producao || ', Designacao: ' || v_designacao || ', Cultura: ' || v_cultura);
        --excecao para ajudar a detetar algum tipo de erro--
EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error during FETCH: ' || SQLERRM);
END;
END LOOP;

CLOSE v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
