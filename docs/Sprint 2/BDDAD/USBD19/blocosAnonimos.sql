--teste com todas as operacoes existentes
DECLARE
cursor1 sys_refcursor;
   var_class classificacao.classificacao%type;
   var_cultura cultura.planta%type;
   var_parcela operacaoFatorProducao.parcela%type;
   dataInicio operacaoFatorProducao.data%type := TO_DATE('12-11-2004', 'DD-MM-YYYY');
   dataFim operacaoFatorProducao.data%type := TO_DATE('2-11-2023', 'DD-MM-YYYY');
BEGIN
   cursor1 := listaAplicacoesFpPorTipoFp(dataInicio, dataFim);
   LOOP
FETCH cursor1 INTO var_class, var_cultura, var_parcela;
      EXIT WHEN cursor1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(var_class || '---' || var_cultura || '---' || var_parcela);
END LOOP;
END;
/

 --teste com lista vazia
DECLARE
cursor1 sys_refcursor;
   var_class classificacao.classificacao%type;
   var_cultura cultura.planta%type;
   var_parcela operacaoFatorProducao.parcela%type;
   dataInicio operacaoFatorProducao.data%type := TO_DATE('12-11-2004', 'DD-MM-YYYY');
   dataFim operacaoFatorProducao.data%type := TO_DATE('12-11-2004', 'DD-MM-YYYY');
BEGIN
   cursor1 := listaAplicacoesFpPorTipoFp(dataInicio, dataFim);
   LOOP
FETCH cursor1 INTO var_class, var_cultura, var_parcela;
      EXIT WHEN cursor1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(var_class || '---' || var_cultura || '---' || var_parcela);
END LOOP;
END;
/

--teste valores trocados da data(deve retornar vazio)
DECLARE
cursor1 sys_refcursor;
   var_class classificacao.classificacao%type;
   var_cultura cultura.planta%type;
   var_parcela operacaoFatorProducao.parcela%type;
   dataInicio operacaoFatorProducao.data%type := TO_DATE('12-11-2020', 'DD-MM-YYYY');
   dataFim operacaoFatorProducao.data%type := TO_DATE('12-11-2003', 'DD-MM-YYYY');
BEGIN
   cursor1 := listaAplicacoesFpPorTipoFp(dataInicio, dataFim);
   LOOP
FETCH cursor1 INTO var_class, var_cultura, var_parcela;
      EXIT WHEN cursor1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(var_class || '---' || var_cultura || '---' || var_parcela);
END LOOP;
END;
/
