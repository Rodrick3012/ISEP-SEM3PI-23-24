set serveroutput on;

-- Teste com data de inicio correta e intervalo de tempo correto
declare
listOperacoes sys_refcursor;
    idOperacao operacaoFatorProducao.id%type;
    parcelaOperacao operacaoFatorProducao.parcela%type;
    tipo operacaoFatorProducao.tipoOperacao%type;
    dataOperacao operacaoFatorProducao.data%type;
    quantidadeOperacao operacaoFatorProducao.quantidade%type;
    fatorProducaoOperacao operacaoFatorProducao.fatorProducao%type;
    substanciaOperacao substanciaFatorProducao.substancia%type;
begin
    listOperacoes := getOperacoesFatorProducaoRealizadas ('Campo grande', to_date('2010-01-01', 'YYYY-MM-DD'), to_date('2023-12-31', 'YYYY-MM-DD'));
    loop
fetch listOperacoes into idOperacao, parcelaOperacao, tipo, dataOperacao, quantidadeOperacao, fatorProducaoOperacao, substanciaOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line ('ID: '|| idOperacao ||' Parcela: '|| parcelaOperacao ||' Tipo: '|| tipo || ' Data: '|| dataOperacao ||' Quantidade: '||quantidadeOperacao || ' Fator Produção: ' || fatorProducaoOperacao || ' Substância: ' || substanciaOperacao);
end loop;
end;
/

-- Teste com data de inicio incorreta (no futuro)
declare
listOperacoes sys_refcursor;
    idOperacao operacaoFatorProducao.id%type;
    parcelaOperacao operacaoFatorProducao.parcela%type;
    tipo operacaoFatorProducao.tipoOperacao%type;
    dataOperacao operacaoFatorProducao.data%type;
    quantidadeOperacao operacaoFatorProducao.quantidade%type;
    fatorProducaoOperacao operacaoFatorProducao.fatorProducao%type;
    substanciaOperacao substanciaFatorProducao.substancia%type;
begin
    listOperacoes := getOperacoesFatorProducaoRealizadas ('Campo grande', to_date('2030-01-01', 'YYYY-MM-DD'), to_date('2023-12-31', 'YYYY-MM-DD'));
    loop
fetch listOperacoes into idOperacao, parcelaOperacao, tipo, dataOperacao, quantidadeOperacao, fatorProducaoOperacao, substanciaOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line ('ID: '|| idOperacao ||' Parcela: '|| parcelaOperacao ||' Tipo: '|| tipo || ' Data: '|| dataOperacao ||' Quantidade: '||quantidadeOperacao || ' Fator Produção: ' || fatorProducaoOperacao || ' Substância: ' || substanciaOperacao);
end loop;
end;
/

-- Teste com data de inicio correta, mas com intervalo de tempo incorreto (data inicial maior que a final)
declare
listOperacoes sys_refcursor;
    idOperacao operacaoFatorProducao.id%type;
    parcelaOperacao operacaoFatorProducao.parcela%type;
    tipo operacaoFatorProducao.tipoOperacao%type;
    dataOperacao operacaoFatorProducao.data%type;
    quantidadeOperacao operacaoFatorProducao.quantidade%type;
    fatorProducaoOperacao operacaoFatorProducao.fatorProducao%type;
    substanciaOperacao substanciaFatorProducao.substancia%type;
begin
    listOperacoes := getOperacoesFatorProducaoRealizadas ('Campo grande', to_date('2020-01-01', 'YYYY-MM-DD'),  to_date('2018-12-31', 'YYYY-MM-DD'));
    loop
fetch listOperacoes into idOperacao, parcelaOperacao, tipo, dataOperacao, quantidadeOperacao, fatorProducaoOperacao, substanciaOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line ('ID: '|| idOperacao ||' Parcela: '|| parcelaOperacao ||' Tipo: '|| tipo || ' Data: '|| dataOperacao ||' Quantidade: '||quantidadeOperacao || ' Fator Produção: ' || fatorProducaoOperacao || ' Substância: ' || substanciaOperacao);
end loop;
end;
/
