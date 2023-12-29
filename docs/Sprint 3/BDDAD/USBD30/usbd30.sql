create or replace NONEDITIONABLE PROCEDURE pcd_anular_operacao_prevista (idOperacao operacao.id%type) AS

    v_data_operacao date;
    v_diferenca_dias number;
    v_id_operacao number := -1;

    ex_data_maior_que_tres_dias EXCEPTION;
    ex_operacoes_dependentes EXCEPTION;



BEGIN

select id into v_id_operacao
from(
        select id from semeadura
        union
        select id from plantacao
        union
        select id from colheita
    ) where id = idOperacao;


-- Verifica se o v_id_operacao foi alterado
IF v_id_operacao = -1 THEN

select data into v_data_operacao
from operacao
where operacao.id = idOperacao;

-- Calcule a diferença em dias entre a data atual e a data da operação
v_diferenca_dias := SYSDATE - v_data_operacao;

        -- Verifique se a diferença é menor que 3 dias
        IF v_diferenca_dias < 3 THEN
        -- Atualize o estado da operação para anulada
UPDATE Operacao SET anulada = 1
WHERE operacao.id = idOperacao;

DBMS_OUTPUT.PUT_LINE('Operação anulada com sucesso.');
ELSE

        RAISE ex_data_maior_que_tres_dias;
END IF;

ELSE

    RAISE ex_operacoes_dependentes;

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