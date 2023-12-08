Create or replace function fncGetSubstantiaNotUsed(data1 NUMBER) return SYS_REFCURSOR
as
    listSubstancia sys_refcursor;
BEGIN
open listSubstancia for
SELECT DISTINCT subs.substancia
FROM substancia subs
         INNER JOIN substanciafatorproducao subsfp ON subs.id = subsfp.substancia
         INNER JOIN fatorproducao fp ON fp.designacao = subsfp.fatorproducao
         INNER JOIN operacaofatorproducao ofp ON fp.designacao = ofp.fatorproducao
         INNER JOIN operacao o ON o.id = ofp.id
WHERE EXTRACT(YEAR FROM o.data) <> data1 -- Substances used in years other than 2023
  AND subs.substancia NOT IN (
    SELECT DISTINCT subs2.substancia
    FROM substancia subs2
             INNER JOIN substanciafatorproducao subsfp2 ON subs2.id = subsfp2.substancia
             INNER JOIN fatorproducao fp ON fp.designacao = subsfp.fatorproducao
             INNER JOIN operacaofatorproducao ofp ON fp.designacao = ofp.fatorproducao
             INNER JOIN operacao o ON o.id = ofp.id
    WHERE EXTRACT(YEAR FROM o.data) = data1 -- Substances used in 2023
);
return (listSubstancia);
END;




DECLARE
v_substancia varchar2(100);
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := fncGetSubstantiaNotUsed(1);

LOOP
FETCH v_cursor INTO v_substancia;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_substancia);
END LOOP;

CLOSE v_cursor;
END;