--teste ao validaFatorProducao
DECLARE
var boolean;

BEGIN

--Should return false
var:= validateFatorProducao('a');
dbms_output.put_line (case when var then 'true' else 'false' end);

-Should return true
var:= validateFatorProducao('Patentkali');
dbms_output.put_line (case when var then 'true' else 'false' end);

END;


--teste ao procedimento US14
DECLARE
tipo_op operacaoFatorProducao.tipoOperacao%type := 6;
	data_teste operacao.data%type := TO_DATE('12-11-2023', 'DD-MM-YYYY');
    data_testeFail operacao.data%type := TO_DATE('20-11-2023', 'DD-MM-YYYY');
	quantidade_teste operacao.quantidade%type := 0;
	quantidade_testeFail operacao.quantidade%type := 100;
	cultura_teste operacao.cultura%type := 12;
	cultura_testeFail operacao.cultura%type := 13;
    parcela_teste operacao.parcela%type := 'Campo grande';
	parcela_testeFail operacao.parcela%type := 13;
	fp fatorProducao.designacao%type := 'Patentkali';
	fpFail operacaoFatorProducao.fatorProducao%type := 'a';
	tOperacaoFail operacaoFatorProducao.tipoOperacao%type := 111;

BEGIN

	--inserção que deve funcionar
	inserirOperacaoAplicacaoFatorProducao(data_teste,quantidade_teste,parcela_teste,fp,cultura_teste,tipo_Op);

	--inserção que deve falhar na data
	inserirOperacaoAplicacaoFatorProducao(data_testeFail,quantidade_teste,parcela_teste,fp,cultura_teste,tipo_Op);

    --inserção que deve falhar na quantidade
	inserirOperacaoAplicacaoFatorProducao(data_teste,quantidade_testeFail,parcela_teste,fp,cultura_teste,tipo_Op);

	-- inserção que deve falhar na cultura/parcela
	inserirOperacaoAplicacaoFatorProducao(data_teste,quantidade_teste,parcela_testeFail,fp,cultura_testeFail,tipo_Op);

	-- inserção que deve falhar no tipo de operação
	inserirOperacaoAplicacaoFatorProducao(data_teste,quantidade_teste,parcela_teste,fp,cultura_teste,tOperacaoFail);

    --inserção que deve falhar no fator produção
    inserirOperacaoAplicacaoFatorProducao(data_teste,quantidade_teste,parcela_teste,fpFail,cultura_teste,tipo_Op);


END;
