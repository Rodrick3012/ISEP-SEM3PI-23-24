--teste que deve passar para comparacao das datas
DECLARE
resultado BOOLEAN;
  dataInicio operacao.data%type := TO_DATE('2023-01-01', 'YYYY-MM-DD');
  dataFim operacao.data%type := TO_DATE('2023-12-31', 'YYYY-MM-DD');
BEGIN
-- tem que printar que as datas sao validas
  resultado := verificarDataNaoEstaNoFuturo(dataInicio, dataFim);
  IF resultado THEN
    DBMS_OUTPUT.PUT_LINE('As datas são válidas.');
END IF;
END;
/

--teste que deve falhar para comparacao das datas
DECLARE
resultado BOOLEAN;
  dataInicio operacao.data%type := TO_DATE('2023-01-01', 'YYYY-MM-DD');
  dataFim operacao.data%type := TO_DATE('2023-12-31', 'YYYY-MM-DD');
BEGIN
--tem que printar que as datas nao sao validas
  resultado := verificarDataNaoEstaNoFuturo(dataFim, dataInicio);
  IF resultado THEN
    DBMS_OUTPUT.PUT_LINE('As datas são válidas.');
ELSE
    DBMS_OUTPUT.PUT_LINE('As datas não são válidas.');
END IF;

END;
/

--teste data valida que nao esta no futuro
DECLARE
resultado BOOLEAN;
BEGIN
  resultado := verificarDataNaoEstaNoFuturo(TO_DATE('2023-11-15', 'YYYY-MM-DD'));
  IF resultado THEN
    DBMS_OUTPUT.PUT_LINE('A data é válida.');
END;

--teste data invalida que esta no futuro
DECLARE
resultado BOOLEAN;
BEGIN
  resultado := verificarDataNaoEstaNoFuturo(TO_DATE('2023-11-20', 'YYYY-MM-DD'));
  IF resultado THEN
    DBMS_OUTPUT.PUT_LINE('A data é válida.');
END;
/
--teste inserçao de operacao mas com cultura/parcela invalida
DECLARE
tipo_op operacao.tipoOperacao%type := 6;
    data_teste operacao.data%type := TO_DATE('12-11-2023', 'DD-MM-YYYY');
    data_testeFail operacao.data%type := TO_DATE('20-11-2023', 'DD-MM-YYYY');
	quantidade_teste operacao.quantidade%type := 0;
	cultura_teste operacao.cultura%type := 12;
	cultura_testeFail operacao.cultura%type := 13;
    parcela_teste operacao.parcela%type := 'Campo grande';
BEGIN
		--test que falha na cultura/parcela
	 inserirSemeadura(tipo_op, data_teste, quantidade_teste, cultura_testeFail, parcela_teste);
        DBMS_OUTPUT.PUT_LINE('Bloco anônimo executado com sucesso.');

EXCEPTION
        WHEN OTHERS THEN
        	DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);


END;
/

--teste inserçao de operacao mas com data invalida
DECLARE
tipo_op operacao.tipoOperacao%type := 6;
    data_testeFail operacao.data%type := TO_DATE('20-11-2023', 'DD-MM-YYYY');
	quantidade_teste operacao.quantidade%type := 0;
	cultura_teste operacao.cultura%type := 12;
    parcela_teste operacao.parcela%type := 'Campo grande';
BEGIN

		-- test que falha na data
		inserirSemeadura(tipo_op, data_testeFail, quantidade_teste, cultura_teste, parcela_teste);
        DBMS_OUTPUT.PUT_LINE('Bloco anônimo executado com sucesso.');

EXCEPTION
        WHEN OTHERS THEN
        	DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);


END;
/

--teste inserçao de operacao mas com quantidade invalida
DECLARE
tipo_op operacao.tipoOperacao%type := 6;
    data_teste operacao.data%type := TO_DATE('10-11-2023', 'DD-MM-YYYY');
    quantidade_testeFail operacao.quantidade%type := 10000;
	cultura_teste operacao.cultura%type := 12;
	cultura_testeFail operacao.cultura%type := 13;
    parcela_teste operacao.parcela%type := 'Campo grande';
BEGIN
		--test que falha na quantidade
		inserirSemeadura(tipo_op, data_teste, quantidade_testeFail, cultura_teste, parcela_teste);
        DBMS_OUTPUT.PUT_LINE('Bloco anônimo executado com sucesso.');

EXCEPTION
        WHEN OTHERS THEN
        	DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
