SELECT
    operacao.parcela AS nome_parcela,
    cultura.planta AS produto,
    SUM(operacao.quantidade) AS quantidadeProdutosColhidos,
    unidade.unidade
FROM operacao
         INNER JOIN tipoOperacao ON tipoOperacao.id = operacao.tipoOperacao
         INNER JOIN cultura ON cultura.id = operacao.cultura
         INNER JOIN unidade on unidade.id = operacao.unidade
WHERE tipoOperacao.tipoOperacao LIKE 'Colheita'
  AND operacao.parcela LIKE 'Lameiro da ponte'
  AND operacao.data BETWEEN TO_DATE('2021-01-07', 'YYYY-MM-DD') AND TO_DATE('2021-10-18', 'YYYY-MM-DD')
GROUP BY operacao.parcela, cultura.planta, unidade.unidade;
