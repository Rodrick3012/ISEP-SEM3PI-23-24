SELECT operacao.parcela, tipoOperacao.tipoOperacao, COUNT(operacao.parcela) AS contagem_Operacoes
FROM operacao
         INNER JOIN parcela ON parcela.designacao = operacao.parcela
         INNER JOIN tipoOperacao on tipoOperacao.id = operacao.tipoOperacao
WHERE operacao.parcela LIKE 'Vinha'
  AND operacao.data BETWEEN TO_DATE('2022-12-11', 'YYYY-MM-DD') AND TO_DATE('2023-03-20', 'YYYY-MM-DD')
GROUP BY operacao.parcela, tipoOperacao.tipoOperacao

UNION

SELECT operacaoFatorProducao.parcela, classificacao.classificacao, COUNT(operacaoFatorProducao.parcela) AS contagemFatoresProducao
FROM operacaoFatorProducao
         INNER JOIN parcela ON parcela.designacao = operacaoFatorProducao.parcela
         INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         INNER JOIN classificacao ON classificacao.id = fatorProducao.classificacao
WHERE operacaoFatorProducao.parcela LIKE 'Vinha'
  AND operacaoFatorProducao.data BETWEEN TO_DATE('2022-12-11', 'YYYY-MM-DD') AND TO_DATE('2023-03-20', 'YYYY-MM-DD')
GROUP BY operacaoFatorProducao.parcela, classificacao.classificacao;