CREATE OR REPLACE FUNCTION listaAplicacoesFpPorTipoFp(
      pdataInicial operacaoFatorProducao.data%type
    , pdataFinal operacaoFatorProducao.data%type) RETURN SYS_REFCURSOR
IS
  cursor1 SYS_REFCURSOR;
BEGIN
OPEN cursor1 FOR
SELECT
    classificacao.classificacao AS tipo_fator_producao,
    parcela,
    NVL(cultura.planta, 'Inexistente') AS cultura
FROM operacaoFatorProducao
         INNER JOIN fatorProducao ON fatorProducao.designacao = operacaoFatorProducao.fatorProducao
         INNER JOIN classificacao ON classificacao.id = fatorProducao.classificacao
         LEFT JOIN cultura ON cultura.id = operacaoFatorProducao.cultura
WHERE
    operacaoFatorProducao.data BETWEEN pdataInicial AND pdataFinal
GROUP BY NVL(cultura.planta,'Inexistente'),parcela,classificacao.classificacao
ORDER BY tipo_fator_producao;
RETURN cursor1;
END;
/