CREATE OR REPLACE PROCEDURE pcd_registrar_receita_fertirrega (p_cursor SYS_REFCURSOR) AS
    v_fator_producao VARCHAR2(30);
    v_id_mixFertirrega NUMBER;
BEGIN

INSERT INTO mixFertirrega VALUES (DEFAULT) returning id into v_id_mixFertirrega;

LOOP
FETCH p_cursor INTO v_fator_producao;
        EXIT WHEN p_cursor%NOTFOUND;
INSERT INTO mixFertirrega_FatorProducao VALUES (v_id_mixFertirrega, v_fator_producao);
END LOOP;

CLOSE p_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
        RAISE;
END pcd_registrar_receita_fertirrega;
/

DECLARE
v_cursor SYS_REFCURSOR;
BEGIN

OPEN v_cursor FOR
SELECT designacao FROM fatorProducao
WHERE designacao IN ('Sonata', 'FLiPPER');

pcd_registrar_receita_fertirrega(v_cursor);

END;
/
