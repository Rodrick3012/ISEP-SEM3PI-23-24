create or replace NONEDITIONABLE FUNCTION getRegaMothlyForDate(data1 operacao.data%type,data2 operacao.data%type) return SYS_REFCURSOR
IS
    retorno SYS_REFCURSOR;
BEGIN

    OPEN retorno for

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
                CASE WHEN EXTRACT(MONTH FROM o.data) = 1 THEN 1 ELSE 0 END AS January,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 2 THEN 1 ELSE 0 END AS February,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 3 THEN 1 ELSE 0 END AS March,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 4 THEN 1 ELSE 0 END AS April,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 5 THEN 1 ELSE 0 END AS May,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 6 THEN 1 ELSE 0 END AS June,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 7 THEN 1 ELSE 0 END AS July,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 8 THEN 1 ELSE 0 END AS August,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 9 THEN 1 ELSE 0 END AS September,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 10 THEN 1 ELSE 0 END AS October,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 11 THEN 1 ELSE 0 END AS November,
                CASE WHEN EXTRACT(MONTH FROM o.data) = 12 THEN 1 ELSE 0 END AS December
            FROM
                operacao o
            INNER JOIN
                tipooperacao tpo ON tpo.id = o.tipooperacao
            WHERE
                LOWER(tpo.tipooperacao) LIKE LOWER('rega')
                AND o.data BETWEEN TO_DATE('2018-01-01','YYYY-MM-DD') AND TO_DATE('2020-01-01','YYYY-MM-DD')

            UNION ALL

            SELECT
                o.parcela,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 1 THEN 1 ELSE 0 END AS January,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 2 THEN 1 ELSE 0 END AS February,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 3 THEN 1 ELSE 0 END AS March,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 4 THEN 1 ELSE 0 END AS April,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 5 THEN 1 ELSE 0 END AS May,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 6 THEN 1 ELSE 0 END AS June,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 7 THEN 1 ELSE 0 END AS July,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 8 THEN 1 ELSE 0 END AS August,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 9 THEN 1 ELSE 0 END AS September,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 10 THEN 1 ELSE 0 END AS October,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 11 THEN 1 ELSE 0 END AS November,
                CASE WHEN EXTRACT(MONTH FROM o.horario) = 12 THEN 1 ELSE 0 END AS December
            FROM
                operacaoRega o
            WHERE
                o.horario BETWEEN TO_DATE('2018-01-01','YYYY-MM-DD') AND TO_DATE('2024-01-01','YYYY-MM-DD')
        )
        GROUP BY
            parcela
        ORDER BY
            parcela;

    RETURN (retorno);
END;
