--Teste de inserçao de operacao mas com cultura/parcela invalida
declare
tipo_op operacao.tipoOperacao%type := 7;
    data_teste operacao.data%type := '23-11-12';
    data_testeFail operacao.data%type := '29-11-20';
	quantidade_teste operacao.quantidade%type := 0;
	cultura_teste operacao.cultura%type := 12;
	cultura_testeFail operacao.cultura%type := 13;
    parcela_teste operacao.parcela%type := 'Campo grande';
begin
		--Teste que falha na cultura/parcela
	 inserirOperacao(tipo_op, data_teste, quantidade_teste, cultura_testeFail, parcela_teste);
        DBMS_OUTPUT.PUT_LINE('Bloco anônimo executado com sucesso.');

exception
    when others then
        	DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
end;
/

--Teste de inserçao de operacao mas com data invalida
declare
tipo_op operacao.tipoOperacao%type := 7;
    data_testeFail operacao.data%type := '29-11-20';
	quantidade_teste operacao.quantidade%type := 0;
	cultura_teste operacao.cultura%type := 12;
    parcela_teste operacao.parcela%type := 'Campo grande';
begin
		-- Teste que falha na data
		inserirOperacao(tipo_op, data_testeFail, quantidade_teste, cultura_teste, parcela_teste);
        DBMS_OUTPUT.PUT_LINE('Bloco anônimo executado com sucesso.');

exception
        when others then
        	DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
end;
/

-- Teste de inserçao de operacao mas com quantidade invalida
declare
tipo_op operacao.tipoOperacao%type := 7;
    data_teste operacao.data%type := '23-11-10';
    quantidade_testeFail operacao.quantidade%type := 10000;
	cultura_teste operacao.cultura%type := 12;
	cultura_testeFail operacao.cultura%type := 13;
    parcela_teste operacao.parcela%type := 'Campo grande';
begin
		-- Teste que falha na quantidade
		inserirOperacao(tipo_op, data_teste, quantidade_testeFail, cultura_teste, parcela_teste);
        DBMS_OUTPUT.PUT_LINE('Bloco anônimo executado com sucesso.');

exception
        when others then
        	DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
end;