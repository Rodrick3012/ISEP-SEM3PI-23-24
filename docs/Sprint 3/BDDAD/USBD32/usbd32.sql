CREATE OR REPLACE PROCEDURE pcdInserirOperacaoFertirrega (
    psetor setor.setor%type,
    pduracao operacaoRegaSetor.duracao%type,
    pdata DATE,
    horaMinSeg VARCHAR,
    receita Receita_FatorProducao.idReceita%type
)
IS
    DataInvalida EXCEPTION;
    HoraInvalida EXCEPTION;
    ListaCulturasVazia EXCEPTION;
    SomatorioNulo EXCEPTION;
    ReceitaInvalida EXCEPTION;
    SetorInvalido EXCEPTION;

    v_idFpCursor SYS_REFCURSOR;
    v_setorCursor SYS_REFCURSOR;

    v_idOperacao NUMBER;
    v_idCultura NUMBER;
    v_quantidadeFp Receita_FatorProducao.quantidade%type;
    v_idFp FatorProducao.designacao%type;
    v_timestamp operacaoRegaSetor.horario%type;
    v_lista_culturas t_lista_culturas := t_lista_culturas();
    v_id NUMBER;
    v_somatorio NUMBER;
    v_contadora NUMBER;

BEGIN
    IF pdata IS NULL THEN
        RAISE DataInvalida;
END IF;

    IF horaMinSeg IS NULL THEN
        RAISE HoraInvalida;
END IF;

SELECT COUNT(*)
INTO v_contadora
FROM Receita_FatorProducao
WHERE idReceita = receita;

IF v_contadora = 0 THEN
        RAISE ReceitaInvalida;
END IF;

SELECT COUNT(*)
INTO v_contadora
FROM setor
WHERE setor.setor = psetor;

IF v_contadora = 0 THEN
        RAISE SetorInvalido;
END IF;

    v_timestamp := TO_TIMESTAMP(TO_CHAR(pdata, 'YYYY-MM-DD') || ' ' || horaMinSeg, 'YYYY-MM-DD HH24:MI:SS');

OPEN v_setorCursor FOR
SELECT cultura
FROM culturaSetor
WHERE setor = psetor;

LOOP
FETCH v_setorCursor INTO v_id;
        EXIT WHEN v_setorCursor%NOTFOUND;
        v_lista_culturas.extend;
        v_lista_culturas(v_lista_culturas.last) := v_id;
END LOOP;

CLOSE v_setorCursor;

IF v_lista_culturas.COUNT = 0 THEN
        RAISE ListaCulturasVazia;
END IF;

    v_somatorio := calcular_somatorio_areas(v_lista_culturas);

    IF v_somatorio IS NULL THEN
        RAISE SomatorioNulo;
END IF;

INSERT INTO operacao (data) VALUES (pdata) RETURNING id INTO v_idOperacao;
INSERT INTO operacaoRegaSetor (id, duracao, horario, setor) VALUES (v_idOperacao, pduracao, v_timestamp, psetor);
INSERT INTO operacaoFatorProducao VALUES (v_idOperacao, v_somatorio);
INSERT INTO operacaoFpCultura VALUES (v_idOperacao, 2);

OPEN v_idFpCursor FOR
SELECT fatorProducao, quantidade
FROM Receita_FatorProducao
WHERE idReceita = receita;

LOOP
FETCH v_idFpCursor INTO v_idFp, v_quantidadeFp;
        EXIT WHEN v_idFpCursor%NOTFOUND;
INSERT INTO fatorProducao_operacao VALUES(v_idOperacao, v_idFp, v_quantidadeFp);
END LOOP;

CLOSE v_idFpCursor;

FOR i IN 1..v_lista_culturas.COUNT LOOP
        INSERT INTO culturaOperacaoFatorProducao VALUES (v_idOperacao, v_lista_culturas(i));
END LOOP;

EXCEPTION
    WHEN DataInvalida THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Data inválida.');
        RAISE_APPLICATION_ERROR(-20001, 'Data inválida');
WHEN HoraInvalida THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Hora inválida.');
        RAISE_APPLICATION_ERROR(-20001, 'Hora inválida');
WHEN ReceitaInvalida THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Receita inválida.');
        RAISE_APPLICATION_ERROR(-20001, 'Receita inválida');
WHEN SetorInvalido THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Setor inválido.');
        RAISE_APPLICATION_ERROR(-20001, 'Setor inválido');
WHEN ListaCulturasVazia THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Lista de culturas vazia.');
        RAISE_APPLICATION_ERROR(-20001, 'Lista de culturas vazia');
WHEN SomatorioNulo THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Somatório é nulo.');
        RAISE_APPLICATION_ERROR(-20001, 'Área inválida');
WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
        RAISE_APPLICATION_ERROR(-20001, 'Erro desconhecido');
END pcdInserirOperacaoFertirrega;
/


CREATE OR REPLACE TYPE t_lista_culturas AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION calcular_somatorio_areas(p_lista_culturas t_lista_culturas) RETURN NUMBER
AS
  v_somatorio NUMBER := 0;
BEGIN
  -- Calcular a somatória das áreas
SELECT SUM(q.quantidade)
INTO v_somatorio
FROM culturaSetor cs
         INNER JOIN cultura c ON cs.cultura = c.id
         INNER JOIN quantidade q ON c.id = q.cultura
WHERE c.id MEMBER OF p_lista_culturas AND q.unidade = 2;

RETURN v_somatorio;
END calcular_somatorio_areas;
/

DECLARE
v_lista_culturas t_lista_culturas := t_lista_culturas(10,11, 12);
  v_somatorio NUMBER;
BEGIN
  v_somatorio := calcular_somatoria_areas(v_lista_culturas);
END;
/






--Caso com valores validos
DECLARE
psetor setor.setor%type := 10;
    pduracao operacaoRegaSetor.duracao%type := 90;
    pdata DATE := TO_DATE('2023-09-02', 'YYYY-MM-DD');
    horaMinSeg VARCHAR(8) := '05:00:00';
    receita Receita_FatorProducao.idReceita%type := 10;

BEGIN
    pcdInserirOperacaoFertirrega(psetor, pduracao, pdata, horaMinSeg, receita);
END;
/

--Caso com receita invalida
BEGIN
    pcdInserirOperacaoFertirrega(10, 60,TO_DATE('02/06/2023','DD/MM/YYYY'), '06:00:00',40);
END;
/

--Caso com setor invalido
BEGIN
    pcdInserirOperacaoFertirrega(300, 60,TO_DATE('02/06/2023','DD/MM/YYYY'), '06:00:00',10);
END;
/