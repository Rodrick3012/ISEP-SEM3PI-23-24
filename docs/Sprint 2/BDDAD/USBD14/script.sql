--USBD14 - Como Gestor Agrícola, quero registar uma operação de aplicacão de fator de produção

--Parametros - data, quantidade, parcela, modo, fatorProducao, cultura, tipoOperacao

--Calda Bordalesa ASCENZA

CREATE OR REPLACE PROCEDURE inserirOperacaoAplicacaoFatorProducao(data1 operacaoFatorProducao.data%type
    ,quantidade1 operacaoFatorProducao.quantidade%type
    ,parcela1 operacaoFatorProducao.parcela%type
    ,fp operacaoFatorProducao.fatorProducao%type
    ,cultura1 operacaoFatorProducao.cultura%type
    ,tipoOp operacaoFatorProducao.tipoOperacao%type)
IS

var_boolean boolean;
dataInvalida EXCEPTION;
quantidadeInvalida EXCEPTION;
culturaParcelaInvalida EXCEPTION;
fpInvalido EXCEPTION;
toInvalido EXCEPTION;

BEGIN
    var_boolean := verificarDataNaoEstaNoFuturo(data1);

CASE
    WHEN var_boolean THEN
      DBMS_OUTPUT.PUT_LINE('Data Válida!!! ' );
ELSE
	  RAISE dataInvalida;
END CASE;

	var_boolean := verificarQuantidadeValida(quantidade1, cultura1);
CASE
	WHEN var_boolean THEN
      DBMS_OUTPUT.PUT_LINE('Quantidade Válida!!! ' );
ELSE
	  RAISE quantidadeInvalida;
END CASE;

	var_boolean := validateCulturaNaParcela(parcela1,cultura1);
CASE
	WHEN var_boolean THEN
      DBMS_OUTPUT.PUT_LINE('Cultura e parcela Válidos!!!');
ELSE
    RAISE culturaParcelaInvalida;
END CASE;

	var_boolean := validateFatorProducao(fp);
CASE
    WHEN var_boolean THEN
      DBMS_OUTPUT.PUT_LINE('fator de Producao válido!!!');
ELSE
    RAISE fpInvalido;
END CASE;

	var_boolean := validateOperacao(tipoOp);
CASE
    WHEN var_boolean THEN
 	  DBMS_OUTPUT.PUT_LINE('tipo operação válido!!!');
ELSE
    RAISE toInvalido;
END CASE;
insert into operacaoFatorProducao(data,quantidade,parcela,modo,fatorproducao,cultura ,tipooperacao) values(data1,quantidade1,parcela1,2,fp,cultura1,tipoOp);

DBMS_OUTPUT.PUT_LINE('Inserção bem-sucedida: ' || SQL%ROWCOUNT || ' linha(s) inserida(s).');

EXCEPTION
    WHEN culturaParcelaInvalida THEN
        RAISE_APPLICATION_ERROR(-20001, 'insert fail cultura/parcela inválidos');
WHEN dataInvalida THEN
  		RAISE_APPLICATION_ERROR(-20001, 'insert fail data inválida');
WHEN quantidadeInvalida THEN
        RAISE_APPLICATION_ERROR(-20001, 'insert fail quantidade inválida');
WHEN fpInvalido THEN
        RAISE_APPLICATION_ERROR(-20001, 'insert fail fator producao inválido');
WHEN toInvalido THEN
        RAISE_APPLICATION_ERROR(-20001, 'insert fail tipo fator producao inválido');
WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
END;



--FUNÇÃO VALIDAÇÃO FATOR PRODUCAO

CREATE OR REPLACE FUNCTION validateFatorProducao(fp fatorproducao.designacao%type) RETURN BOOLEAN
IS
v_boolean boolean;
v_count int;
BEGIN

select count(*) into v_count
from fatorProducao
where fatorProducao.designacao = fp;

if v_count = 0 then
return false;
else
return true;
end if;
END;


--FUNÇÃO VALIDAÇÃO OPERAÇÃO


CREATE OR REPLACE FUNCTION validateOperacao(op tipoOperacao.id%type) RETURN BOOLEAN
IS
v_boolean boolean;
v_count int;
BEGIN

select count(*) into v_count
from tipoOperacao
where tipoOperacao.id = op;

if v_count = 0 then
return false;
else
return true;
end if;
END;