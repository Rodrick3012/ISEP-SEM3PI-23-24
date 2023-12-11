CREATE OR REPLACE PROCEDURE pcdInserirOperacaoRega(
    psetor setor.setor%type,
    pduracao operacaoRegaSetor.duracao%type,
    pdata DATE,
    horaMinSeg VARCHAR,
    p_mixFerti mixFertirrega.id%type DEFAULT -1
)
IS
    v_timestamp operacaoRegaSetor.horario%type;
    v_id NUMBER;
BEGIN

    v_timestamp := TO_TIMESTAMP(TO_CHAR(pdata, 'YYYY-MM-DD') || ' ' || horaMinSeg, 'YYYY-MM-DD HH24:MI:SS');

INSERT INTO operacao (data) VALUES (pdata) RETURNING id INTO v_id;

INSERT INTO operacaoRegaSetor (id, duracao, horario, setor)
VALUES (v_id, pduracao, v_timestamp, psetor);

IF p_mixFerti <> -1 THEN
        INSERT INTO RegaFertirrega (operacaoRegaSetor, mixFertirrega) VALUES (v_id, p_mixFerti);
END IF;

COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);

        RAISE_APPLICATION_ERROR(-20001, 'Erro');

ROLLBACK;
END;
/



DECLARE
v_setor setor.setor%type :=10;
    v_duracao operacaoRegaSetor.duracao%type := 6969;
    v_data DATE := SYSDATE;
    v_horaMinSeg VARCHAR2(8) := '12:34:56';
    v_mixFerti mixFertirrega.id%type :=2 ;

BEGIN
    pcdInserirOperacaoRega(v_setor, v_duracao, v_data, v_horaMinSeg, v_mixFerti);

    DBMS_OUTPUT.PUT_LINE('Procedimento executado com sucesso.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
ROLLBACK;
END;
/

DECLARE
v_setor setor.setor%type :=10;
    v_duracao operacaoRegaSetor.duracao%type := 6969;
    v_data DATE := SYSDATE;
    v_horaMinSeg VARCHAR2(8) := '12:34:56';

BEGIN
    pcdInserirOperacaoRega(v_setor, v_duracao, v_data, v_horaMinSeg);

    DBMS_OUTPUT.PUT_LINE('Procedimento executado com sucesso.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
ROLLBACK;
END;
/


