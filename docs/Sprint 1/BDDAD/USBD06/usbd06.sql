
SELECT operacaoFatorProducao.parcela, classificacao.classificacao, COUNT(operacaoFatorProducao.parcela) AS contagemFatoresProducao
FROM operacaoFatorProducao
         INNER JOIN parcela ON parcela.designacao = operacaoFatorProducao.parcela
         INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         INNER JOIN classificacao ON classificacao.id = fatorProducao.classificacao
WHERE operacaoFatorProducao.parcela LIKE 'Vinha'
  AND operacaoFatorProducao.data BETWEEN TO_DATE('2021-01-07', 'YYYY-MM-DD') AND TO_DATE('2021-10-18', 'YYYY-MM-DD')
GROUP BY operacaoFatorProducao.parcela, classificacao.classificacao;