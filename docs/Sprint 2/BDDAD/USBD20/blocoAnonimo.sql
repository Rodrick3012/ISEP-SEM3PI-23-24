DECLARE
    rega_cursor SYS_REFCURSOR;
    v_parcela operacao.parcela%TYPE;
    v_values SYS.DBMS_SQL.NUMBER_TABLE;

    TYPE t_month IS TABLE OF VARCHAR2(15);
    l_month_names t_month := t_month('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

    v_index NUMBER;
BEGIN
    rega_cursor := getRegaMothlyForDate(TO_DATE('2002-01-01', 'YYYY-MM-DD'), TO_DATE('2017-12-31', 'YYYY-MM-DD'));

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
