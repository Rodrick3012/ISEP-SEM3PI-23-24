SELECT fatorProducao, total_aplicacoes
FROM (
         SELECT operacaoFatorProducao.fatorProducao, COUNT(operacaoFatorProducao.fatorProducao) AS total_aplicacoes
         FROM operacaoFatorProducao
            INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         WHERE operacaoFatorProducao.data BETWEEN TO_DATE('2009-12-11', 'YYYY-MM-DD') AND TO_DATE('2023-03-20', 'YYYY-MM-DD')
         GROUP BY operacaoFatorProducao.fatorProducao
     )
WHERE total_aplicacoes = (
    SELECT MAX(total_aplicacoes)
    FROM (
             SELECT operacaoFatorProducao.fatorProducao, COUNT(operacaoFatorProducao.fatorProducao) AS total_aplicacoes
             FROM operacaoFatorProducao
                INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
             WHERE operacaoFatorProducao.data BETWEEN TO_DATE('2009-12-11', 'YYYY-MM-DD') AND TO_DATE('2023-03-20', 'YYYY-MM-DD')
             GROUP BY operacaoFatorProducao.fatorProducao
         )
);