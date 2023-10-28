SELECT operacaoFatorProducao.fatorProducao, count (operacaoFatorProducao.fatorProducao)
FROM operacaoFatorProducao
INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
WHERE operacaoFatorProducao.data BETWEEN TO_DATE('2022-12-11', 'YYYY-MM-DD') AND TO_DATE('2023-03-20', 'YYYY-MM-DD')
GROUP BY operacaoFatorProducao.fatorProducao