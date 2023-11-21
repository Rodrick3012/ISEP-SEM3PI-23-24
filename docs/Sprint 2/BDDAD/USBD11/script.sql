--funcao validacao data/datas
CREATE OR REPLACE FUNCTION verificarDataNaoEstaNoFuturo(data1 operacao.data%type,
                                                                    data2 operacao.data%type DEFAULT NULL)
RETURN BOOLEAN
IS
  var_boolean BOOLEAN;
  dataAtual DATE;
BEGIN
  -- Obtém a data atual do banco de dados
SELECT CURRENT_DATE INTO dataAtual FROM DUAL;

IF data1 <= dataAtual AND (data2 IS NULL OR data1 <= data2) THEN
    var_boolean := TRUE;
ELSE
    raise_application_error(-20001, 'Data inválida');
END IF;

RETURN var_boolean;
END;

--funcao validacao cultura/parcela
create or replace FUNCTION validateCulturaNaParcela(parcela1 parcela.designacao%type, culturaId cultura.id%type) return boolean
is var_boolean boolean;
	var_quantidade number;

BEGIN
select count(*) into var_quantidade
from ParcelaCultura
where parcelaCultura.parcela = parcela1 AND parcelaCultura.cultura = culturaId;


if var_quantidade > 0 then
return true;
else
raise_application_error(-20001, 'Cultura/Parcela inválido');
end if;
End;
/

-- procedimento para inserir uma operacao
CREATE OR REPLACE PROCEDURE inserirOperacao(
    tipoOperacao operacao.tipoOperacao%type,
    data1 operacao.data%type,
    quantidade1 operacao.quantidade%type,
    cultura1 operacao.cultura%type,
    parcela1 operacao.parcela%type
)
IS
    -- Variável booleana para armazenar os resultados das validações
    var_boolean BOOLEAN;

BEGIN
    -- Verificar se a data não está no futuro
    var_boolean := verificarDataNaoEstaNoFuturo(data1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Data Válida!!!');
END IF;

	-- Verificar se a quantidade é válida para a cultura
	var_boolean := verificarQuantidadeValida(quantidade1, cultura1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Quantidade Válida!!!');
END IF;

    -- Verificar se a cultura está na parcela
    var_boolean := validateCulturaNaParcela(parcela1, cultura1);
    IF var_boolean THEN
        DBMS_OUTPUT.PUT_LINE('Cultura e parcela Válidos!!!');
END IF;

    -- Inserir os dados na tabela
INSERT INTO operacao (parcela, tipoOperacao, cultura, data, quantidade)
VALUES (parcela1, tipoOperacao, cultura1, data1, quantidade1);

DBMS_OUTPUT.PUT_LINE('Inserção bem-sucedida: ' || SQL%ROWCOUNT || ' linha(s) inserida(s).');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Inserção mal-sucedida devido a um erro inesperado.');
END;
/