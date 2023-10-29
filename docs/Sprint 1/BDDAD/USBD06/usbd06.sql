SELECT operacaoFatorProducao.parcela, classificacao.classificacao, COUNT(operacaoFatorProducao.parcela) AS contagem
FROM operacaoFatorProducao
         INNER JOIN parcela ON parcela.designacao = operacaoFatorProducao.parcela
         INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         INNER JOIN classificacao ON classificacao.id = fatorProducao.classificacao
WHERE operacaoFatorProducao.parcela LIKE 'Vinha'
  AND operacaoFatorProducao.data BETWEEN '07-jan-2021' AND '18-oct-2021'
GROUP BY operacaoFatorProducao.parcela, classificacao.classificacao;