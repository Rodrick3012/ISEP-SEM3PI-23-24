create or replace function fncOperacoesRealizadas
    (parcelaDada operacao.parcela%type, dataInicio operacao.data%type, 
        dataFim operacao.data%type) return sys_refcursor
is
    listOperacoes sys_refcursor;
    validacao boolean;
    dataInvalida exception;
begin
    validacao := verificardatanaoestanofuturo(datainicio);
    validacao := verificardatanaoestanofuturo(dataInicio, dataFim);
    if validacao then
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
    else
        raise dataInvalida;
    end if;
    exception
        when dataInvalida then
            raise_application_error(-20001, 'Data inválida');
end;