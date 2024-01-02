CREATE OR REPLACE PROCEDURE pcdInserirOperacaoRega(
    psetor setor.setor%type,
    pduracao operacaoRegaSetor.duracao%type,
    pdata DATE,
    horaMinSeg VARCHAR,
    receita Receita_FatorProducao.idReceita%type,
    pArea operacaoFatorProducao.area%type
)
IS
    v_idFpCursor SYS_REFCURSOR;
    v_idOperacao number;
    v_idCultura number;
    v_quantidadeFp Receita_FatorProducao.quantidade%type;
    v_idFp FatorProducao.designacao%type;
    v_timestamp operacaoRegaSetor.horario%type;
    v_setorCursor SYS_REFCURSOR;
BEGIN
    v_timestamp := TO_TIMESTAMP(TO_CHAR(pdata, 'YYYY-MM-DD') || ' ' || horaMinSeg, 'YYYY-MM-DD HH24:MI:SS');
OPEN v_idFpCursor FOR
SELECT fatorProducao, quantidade
FROM Receita_FatorProducao
WHERE idReceita = receita;

OPEN v_setorCursor FOR
SELECT cultura
FROM culturaSetor
WHERE setor = psetor;


INSERT INTO operacao (data) VALUES (pdata) RETURNING id INTO v_idOperacao;
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (v_idOperacao, pduracao, v_timestamp, psetor);
INSERT INTO operacaoFatorProducao VALUES (v_idOperacao, pArea);
INSERT INTO operacaoFpCultura VALUES (v_idOperacao, 2);

LOOP
FETCH v_idFpCursor INTO v_idFp, v_quantidadeFp;
        EXIT WHEN v_idFpCursor%NOTFOUND;
INSERT INTO fatorProducao_operacao VALUES(v_idOperacao, v_idFp, v_quantidadeFp);
END LOOP;

    LOOP
FETCH v_setorCursor INTO v_idCultura ;
        EXIT WHEN v_setorCursor%NOTFOUND;
INSERT INTO culturaOperacaoFatorProducao VALUES (v_idOperacao, v_idCultura);
END LOOP;

END;
/

