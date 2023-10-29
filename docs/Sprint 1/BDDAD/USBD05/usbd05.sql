SELECT
    operacao.parcela AS nome_parcela,
    planta.nomecomum || ' ' || planta.variedade AS nome,
    planta.produto AS produto,
    SUM(operacao.quantidade) AS quantidadeProdutosColhidos,
    unidade.unidade
FROM operacao
         INNER JOIN tipoOperacao ON tipoOperacao.id = operacao.tipoOperacao
         INNER JOIN cultura ON cultura.id = operacao.cultura
         INNER JOIN unidade on unidade.id = operacao.unidade
    	inner join planta on planta.id = cultura.planta
WHERE tipoOperacao.tipoOperacao LIKE 'Colheita'
  AND operacao.parcela LIKE 'Lameiro da ponte'
  AND operacao.data BETWEEN '07-jan-2021' AND '28-oct-2021'
GROUP BY operacao.parcela, planta.nomecomum || ' ' || planta.variedade,planta.produto, unidade.unidade;