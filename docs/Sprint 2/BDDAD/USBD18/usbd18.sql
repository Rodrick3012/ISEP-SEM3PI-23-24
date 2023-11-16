set serveroutput on;

create or replace function getOperacoesRealizadas
    (parcelaDada operacao.parcela%type, dataInicio operacao.data%type, 
        dataFim operacao.data%type) return sys_refcursor
is
    listOperacoes sys_refcursor;
begin
    open listOperacoes for
        select operacao.id, operacao.parcela, tipoOperacao.tipoOperacao, 
            operacao.data, operacao.quantidade
        from operacao
            inner join parcela on parcela.designacao = operacao.parcela
            inner join tipooperacao on tipooperacao.id = operacao.tipooperacao
        where operacao.parcela like parcelaDada
            and operacao.data between dataInicio and dataFim

        union 

        select operacaoFatorProducao.id, operacaoFatorProducao.parcela, tipoOperacao.tipoOperacao,
            operacaoFatorProducao.data, operacaoFatorProducao.quantidade
        from operacaoFatorProducao
            inner join parcela on parcela.designacao = operacaoFatorProducao.parcela
            inner join fatorProducao on fatorproducao.designacao = operacaofatorproducao.fatorproducao
            inner join tipoOperacao on tipoOperacao.id = operacaoFatorProducao.tipooperacao
        where operacaoFatorProducao.parcela like parcelaDada
            and operacaoFatorProducao.data between dataInicio and dataFim;
    return (listOperacoes);
end;
/

declare
    listOperacoes sys_refcursor;
    idOperacao operacao.id%type;
    parcelaOperacao operacao.parcela%type;
    tipo tipoOperacao.tipoOperacao%type;
    dataOperacao operacao.data%type;
    quantidadeOperacao operacao.quantidade%type;
begin
    listOperacoes := getOperacoesRealizadas ('Campo grande', '2010-01-01',  '2023-12-31');
    loop
        fetch listOperacoes into idOperacao, parcelaOperacao, tipo, dataOperacao, quantidadeOperacao;
        exit when listOperacoes%NOTFOUND;
        dbms_output.put_line ('ID: '|| idOperacao ||' Parcela: '|| parcelaOperacao ||' Tipo: '|| tipo || ' Data: '|| dataOperacao ||' Quantidade: '||quantidadeOperacao);
    end loop;
end;
