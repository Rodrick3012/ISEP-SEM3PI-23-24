create or replace NONEDITIONABLE PROCEDURE pcd_anular_operacao_prevista (idOperacao operacao.id%type) AS

    v_data_operacao date;
    v_diferenca_dias number;
    v_result BOOLEAN;
    ex_data_maior_que_tres_dias EXCEPTION;
    ex_operacoes_dependentes EXCEPTION;


BEGIN

    v_result := verifica_id(idOperacao);

    IF  v_result THEN
    RAISE ex_operacoes_dependentes;
ELSE
select data into v_data_operacao
from operacao
where operacao.id = idOperacao;

v_diferenca_dias := SYSDATE - v_data_operacao;

        IF v_diferenca_dias < 3 THEN
UPDATE Operacao SET anulada = 1
WHERE operacao.id = idOperacao;

DBMS_OUTPUT.PUT_LINE('Operação anulada com sucesso.');
ELSE
        raise ex_data_maior_que_tres_dias;
END IF;


END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'A operação com o ID ' || idOperacao || ' não foi encontrada.');

WHEN ex_data_maior_que_tres_dias THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não é possível anular a operação. A diferença de datas é maior que 3 dias.');

WHEN ex_operacoes_dependentes THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não foi possível anular esta operação. Existem operações dependentes desta.');

WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: ' || SQLCODE || ' - ' || SQLERRM);
        RAISE;
END pcd_anular_operacao_prevista;





--Função que verifica id


CREATE OR REPLACE FUNCTION verifica_id(idOperacao INT) RETURN BOOLEAN AS
   v_contador INT;
BEGIN
   -- Tenta encontrar o ID da operação
SELECT COUNT(id)
INTO v_contador
FROM (
         SELECT id FROM semeadura
         UNION
         SELECT id FROM plantacao
         UNION
         SELECT id FROM colheita
     )
WHERE id = idOperacao;

-- Se v_contador for maior que zero, o ID foi encontrado
RETURN v_contador > 0;
END;


DECLARE
v_idOperacao INT := 10;
   v_result BOOLEAN;
BEGIN
   v_result := verifica_id(v_idOperacao);

   IF v_result THEN
      DBMS_OUTPUT.PUT_LINE('ID ' || v_idOperacao || ' encontrado.');
ELSE
      DBMS_OUTPUT.PUT_LINE('ID ' || v_idOperacao || ' não encontrado.');
END IF;
END;
/


--testes(blocos anonimos)

    set serveroutput on

Insert INTO operacao (anulada,data) values (0, TO_DATE('04-01-2024', 'DD-MM-YYYY'));

select id from operacao;


INSERT INTO operacaoRegaSetor (id,duracao, horario, setor)
VALUES (334,60, TO_TIMESTAMP('2024-01-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11);

select *
from setor;


select id from operacaoRegaSetor;


DECLARE
v_id_operacao operacao.id%type; -- Substitua o tipo de dado pelo tipo real da coluna ID
BEGIN

   v_id_operacao := 334;

   -- Chame o procedimento pcd_anular_operacao_prevista
   pcd_anular_operacao_prevista(v_id_operacao);
END;
/



SELECT *
FROM operacaoRegaSetor
WHERE duracao = 60
  AND EXTRACT(HOUR FROM horario) = 6
  AND EXTRACT(MINUTE FROM horario) = 0;




DECLARE
v_id_operacao operacao.id%type; -- Substitua o tipo de dado pelo tipo real da coluna ID
BEGIN

   v_id_operacao := 287;

   -- Chame o procedimento pcd_anular_operacao_prevista
   pcd_anular_operacao_prevista(v_id_operacao);
END;
/