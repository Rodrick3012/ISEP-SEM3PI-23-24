create or replace NONEDITIONABLE FUNCTION getRegaMothlyForDate(data1 operacao.data%type,data2 operacao.data%type) return SYS_REFCURSOR
IS
    retorno SYS_REFCURSOR;
BEGIN

    OPEN retorno for
        SELECT
            o.parcela,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 1 THEN 1 ELSE 0 END) AS January,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 2 THEN 1 ELSE 0 END) AS February,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 3 THEN 1 ELSE 0 END) AS March,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 4 THEN 1 ELSE 0 END) AS April,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 5 THEN 1 ELSE 0 END) AS May,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 6 THEN 1 ELSE 0 END) AS June,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 7 THEN 1 ELSE 0 END) AS July,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 8 THEN 1 ELSE 0 END) AS August,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 9 THEN 1 ELSE 0 END) AS September,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 10 THEN 1 ELSE 0 END) AS October,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 11 THEN 1 ELSE 0 END) AS November,
            SUM(CASE WHEN EXTRACT(MONTH FROM o.data) = 12 THEN 1 ELSE 0 END) AS December
        FROM
            operacao o
        INNER JOIN
            tipooperacao tpo ON tpo.id = o.tipooperacao
        WHERE
            LOWER(tpo.tipooperacao) LIKE LOWER('rega')
            AND o.data BETWEEN data1 AND data2
        GROUP BY
            o.parcela
        ORDER BY
            o.parcela;
    RETURN (retorno);
END;