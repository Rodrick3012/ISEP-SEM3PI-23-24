CREATE OR replace  FUNCTION fncListaCulturasMaiorConsumoAgua(pAno INTEGER) RETURN sys_refCursor
IS
    listRetorno sys_refcursor;
BEGIN
OPEN listRetorno FOR
SELECT cultura.id, cultura.planta, SUM(duracao) AS tempoTotalRega
FROM operacaoRegaSetor orr
         LEFT JOIN setor ON setor.setor = orr.setor
         INNER JOIN culturaSetor spc ON spc.setor = setor.setor
         INNER JOIN cultura ON cultura.id = spc.cultura
WHERE EXTRACT(YEAR FROM orr.horario) = pAno
GROUP BY cultura.id, cultura.planta
ORDER BY tempoTotalRega DESC;

RETURN listRetorno;
END;

--Bloco anónimo

DECLARE
v_id NUMBER;
    v_planta VARCHAR2(30);
    v_tempoTotalRega NUMBER;
    v_cursor SYS_REFCURSOR;
BEGIN

    v_cursor := fncListaCulturasMaiorConsumoAgua(2023);

    LOOP

FETCH v_cursor INTO v_id, v_planta, v_tempoTotalRega;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Planta: ' || v_planta || ', Tempo Total de Rega: ' || v_tempoTotalRega);
END LOOP;
CLOSE v_cursor;
END;
/