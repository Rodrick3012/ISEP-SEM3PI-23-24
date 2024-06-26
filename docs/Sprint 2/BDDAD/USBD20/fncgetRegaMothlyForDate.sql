CREATE OR REPLACE NONEDITIONABLE FUNCTION fncgetRegaMothlyForDate(data1 operacao.data%type, data2 operacao.data%type)
    RETURN SYS_REFCURSOR
    IS
    retorno SYS_REFCURSOR;
BEGIN
    OPEN retorno FOR
        SELECT
            parcela,
            SUM(January) AS January,
            SUM(February) AS February,
            SUM(March) AS March,
            SUM(April) AS April,
            SUM(May) AS May,
            SUM(June) AS June,
            SUM(July) AS July,
            SUM(August) AS August,
            SUM(September) AS September,
            SUM(October) AS October,
            SUM(November) AS November,
            SUM(December) AS December
        FROM (
                 SELECT
                     o.parcela,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 1 THEN o.duracao ELSE 0 END AS January,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 2 THEN o.duracao ELSE 0 END AS February,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 3 THEN o.duracao ELSE 0 END AS March,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 4 THEN o.duracao ELSE 0 END AS April,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 5 THEN o.duracao ELSE 0 END AS May,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 6 THEN o.duracao ELSE 0 END AS June,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 7 THEN o.duracao ELSE 0 END AS July,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 8 THEN o.duracao ELSE 0 END AS August,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 9 THEN o.duracao ELSE 0 END AS September,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 10 THEN o.duracao ELSE 0 END AS October,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 11 THEN o.duracao ELSE 0 END AS November,
                     CASE WHEN EXTRACT(MONTH FROM o.horario) = 12 THEN o.duracao ELSE 0 END AS December
                 FROM (
                          SELECT DISTINCT
                              parcela,
                              TRUNC(horario) AS horario,
                              duracao
                          FROM
                              operacaoRega
                          WHERE
                              horario BETWEEN data1 AND data2
                      ) o
             )
        GROUP BY
            parcela
        ORDER BY
            parcela;

    RETURN retorno;
END;

DECLARE
    rega_cursor SYS_REFCURSOR;
    v_parcela operacao.parcela%TYPE;
    v_values SYS.DBMS_SQL.NUMBER_TABLE;

    TYPE t_month IS TABLE OF VARCHAR2(15);
    l_month_names t_month := t_month('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

    v_index NUMBER;
BEGIN
    rega_cursor := fncgetRegaMothlyForDate(TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-11-06', 'YYYY-MM-DD'));

    LOOP
        FETCH rega_cursor INTO v_parcela, v_values(1), v_values(2), v_values(3), v_values(4), v_values(5), v_values(6), v_values(7), v_values(8), v_values(9), v_values(10), v_values(11), v_values(12);

        EXIT WHEN rega_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Parcela: ' || v_parcela);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');

        v_index := v_values.FIRST;
        FOR i IN l_month_names.FIRST..l_month_names.LAST LOOP
                DBMS_OUTPUT.PUT_LINE(l_month_names(i) || ': ' || v_values(v_index));
                v_index := v_index + 1;
            END LOOP;

        DBMS_OUTPUT.PUT_LINE(' ');

    END LOOP;

    CLOSE rega_cursor;
END;

