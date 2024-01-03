create or replace NONEDITIONABLE PROCEDURE pcd_anular_operacao_prevista (idOperacao operacao.id%type) AS

    v_data_operacao date;
    v_diferenca_dias number;
    v_id_operacao number := -1;
    v_result BOOLEAN;
    ex_data_maior_que_tres_dias EXCEPTION;
    ex_operacoes_dependentes EXCEPTION;


BEGIN

    v_result := verifica_id(v_id_operacao);

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