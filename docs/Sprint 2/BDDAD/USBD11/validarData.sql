CREATE OR REPLACE FUNCTION verificarDataNaoEstaNoFuturo(dataAtual date,data1 date,
                                                                    data2 date DEFAULT NULL)
RETURN BOOLEAN
IS
  var_boolean BOOLEAN;
BEGIN

IF data1 = dataAtual AND (data2 IS NULL OR data1 <= data2) THEN
    var_boolean := TRUE;
ELSE
    raise_application_error(-20001, 'Data inválida');
END IF;

RETURN var_boolean;
END;


DECLARE
v_boolean boolean;
BEGIN
v_boolean := verificarDataNaoEstaNoFuturo(TO_DATE('05-11-2020', 'DD-MM-YYYY'),  TO_DATE('12-11-2020', 'DD-MM-YYYY'));
dbms_output.put_line (case when v_boolean then 'true' else 'false' end);
END;
/


DECLARE
v_boolean boolean;
BEGIN
v_boolean := verificarDataNaoEstaNoFuturo(TO_DATE('12-11-2020', 'DD-MM-YYYY'),  TO_DATE('12-11-2020', 'DD-MM-YYYY'));
dbms_output.put_line (case when v_boolean then 'true' else 'false' end);
END;
/


