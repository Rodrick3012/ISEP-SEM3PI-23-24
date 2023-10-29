SELECT operacao.parcela, tipoOperacao.tipoOperacao, COUNT(operacao.parcela) AS contagem_Operacoes
FROM operacao
         INNER JOIN parcela ON parcela.designacao = operacao.parcela
         INNER JOIN tipoOperacao on tipoOperacao.id = operacao.tipoOperacao
WHERE operacao.parcela LIKE 'Vinha'
  AND operacao.data BETWEEN '11-dec-2022' AND '20-mar-2023'
GROUP BY operacao.parcela, tipoOperacao.tipoOperacao

UNION

SELECT operacaoFatorProducao.parcela, tipooperacao.tipooperacao, COUNT(operacaoFatorProducao.parcela) AS contagemFatoresProducao
FROM operacaoFatorProducao
         INNER JOIN parcela ON parcela.designacao = operacaoFatorProducao.parcela
         INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         INNER JOIN tipoOperacao on tipoOperacao.id = operacaoFatorProducao.tipoOperacao
WHERE operacaoFatorProducao.parcela LIKE 'Vinha'
  AND operacaofatorproducao.data BETWEEN '11-dec-2022' AND '20-mar-2023'
GROUP BY operacaoFatorProducao.parcela, tipooperacao.tipooperacao;


