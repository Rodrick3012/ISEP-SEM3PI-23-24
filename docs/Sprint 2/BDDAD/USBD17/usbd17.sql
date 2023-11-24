create function fncOperacoesFatorProducaoRealizadas
(dataAtual date,parcelaDada operacao.parcela%type, dataInicio operacao.data%type,
 dataFim operacao.data%type) return sys_refcursor
    is
    listOperacoes sys_refcursor;
    validacao boolean;
    dataInvalida exception;
begin
    validacao := fncverificardatanaoestanofuturo(dataAtual,dataInicio, dataFim);
    if validacao then
        open listOperacoes for
            select operacaoFatorProducao.id, operacaoFatorProducao.parcela, operacaoFatorProducao.tipoOperacao,
                   operacaoFatorProducao.data, operacaoFatorProducao.quantidade, operacaoFatorProducao.fatorProducao, substancia.substancia
            from operacaoFatorProducao
                     inner join parcela on parcela.designacao = operacaoFatorProducao.parcela
                     inner join tipooperacao on tipooperacao.id = operacaoFatorProducao.tipooperacao
                     inner join fatorproducao on fatorProducao.designacao = operacaoFatorProducao.fatorProducao
                     inner join substanciaFatorProducao on substanciaFatorProducao.fatorProducao = operacaoFatorProducao.fatorProducao
                     inner join substancia on substancia.id = substanciaFatorProducao.substancia
            where operacaoFatorProducao.parcela like parcelaDada
              and operacaoFatorProducao.data between dataInicio and dataFim;

        return (listOperacoes);
    else
        raise dataInvalida;
    end if;
exception
    when dataInvalida then
        raise_application_error(-20001, 'Data inválida');
end;





--blocos anonimos--
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
    substanciaOperacao substancia.substancia%type;
begin
    listOperacoes := fncOperacoesFatorProducaoRealizadas (to_date('2023-11-23', 'YYYY-MM-DD'), 'Campo grande', to_date('2010-01-01', 'YYYY-MM-DD'), to_date('2023-12-31', 'YYYY-MM-DD'));
    loop
        fetch listOperacoes into idOperacao, parcelaOperacao, tipo, dataOperacao, quantidadeOperacao, fatorProducaoOperacao, substanciaOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line ('ID: '|| idOperacao ||' Parcela: '|| parcelaOperacao ||' Tipo: '|| tipo || ' Data: '|| dataOperacao ||' Quantidade: '||quantidadeOperacao || ' Fator Produção: ' || fatorProducaoOperacao || ' Substância: ' || substanciaOperacao);
    end loop;
end;



-- Teste com data de inicio incorreta (no futuro)
declare
    listOperacoes sys_refcursor;
    idOperacao operacaoFatorProducao.id%type;
    parcelaOperacao operacaoFatorProducao.parcela%type;
    tipo operacaoFatorProducao.tipoOperacao%type;
    dataOperacao operacaoFatorProducao.data%type;
    quantidadeOperacao operacaoFatorProducao.quantidade%type;
    fatorProducaoOperacao operacaoFatorProducao.fatorProducao%type;
    substanciaOperacao substancia.substancia%type;
begin
    listOperacoes := fncOperacoesFatorProducaoRealizadas (to_date('2023-11-23', 'YYYY-MM-DD'),'Campo grande', to_date('2030-01-01', 'YYYY-MM-DD'), to_date('2023-12-31', 'YYYY-MM-DD'));
    loop
        fetch listOperacoes into idOperacao, parcelaOperacao, tipo, dataOperacao, quantidadeOperacao, fatorProducaoOperacao, substanciaOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line ('ID: '|| idOperacao ||' Parcela: '|| parcelaOperacao ||' Tipo: '|| tipo || ' Data: '|| dataOperacao ||' Quantidade: '||quantidadeOperacao || ' Fator Produção: ' || fatorProducaoOperacao || ' Substância: ' || substanciaOperacao);
    end loop;
end;



-- Teste com data de inicio correta, mas com intervalo de tempo incorreto (data inicial maior que a final)
declare
    listOperacoes sys_refcursor;
    idOperacao operacaoFatorProducao.id%type;
    parcelaOperacao operacaoFatorProducao.parcela%type;
    tipo operacaoFatorProducao.tipoOperacao%type;
    dataOperacao operacaoFatorProducao.data%type;
    quantidadeOperacao operacaoFatorProducao.quantidade%type;
    fatorProducaoOperacao operacaoFatorProducao.fatorProducao%type;
    substanciaOperacao substancia.substancia%type;
begin
    listOperacoes := fncOperacoesFatorProducaoRealizadas (to_date('2023-11-23', 'YYYY-MM-DD'),'Campo grande', to_date('2020-01-01', 'YYYY-MM-DD'),  to_date('2018-12-31', 'YYYY-MM-DD'));
    loop
        fetch listOperacoes into idOperacao, parcelaOperacao, tipo, dataOperacao, quantidadeOperacao, fatorProducaoOperacao, substanciaOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line ('ID: '|| idOperacao ||' Parcela: '|| parcelaOperacao ||' Tipo: '|| tipo || ' Data: '|| dataOperacao ||' Quantidade: '||quantidadeOperacao || ' Fator Produção: ' || fatorProducaoOperacao || ' Substância: ' || substanciaOperacao);
    end loop;
end;
