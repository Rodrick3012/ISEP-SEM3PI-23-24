CREATE OR REPLACE FUNCTION fncListaCulturasMaiorConsumoAgua(pAno INTEGER) RETURN sys_refCursor
IS
  listRetorno sys_refcursor;
BEGIN
OPEN listRetorno FOR
SELECT c.id, c.planta, SUM(duracao) AS MinutosRega, EXTRACT(YEAR FROM orr.horario) AS ano
FROM operacaoRega orr
         INNER JOIN setorparcelaCultura spc ON spc.cultura = orr.cultura
    AND spc.parcela = orr.parcela
    AND spc.setor = orr.setor
         INNER JOIN parcelaCultura pc ON pc.parcela = spc.parcela
    AND pc.cultura = spc.cultura
         INNER JOIN cultura c ON c.id = pc.cultura
WHERE EXTRACT(YEAR FROM orr.horario) = pAno
GROUP BY c.id, c.planta, EXTRACT(YEAR FROM orr.horario)
ORDER BY MinutosRega DESC, c.id ASC;

RETURN listRetorno;
END;
/

--Bloco anónimo

DECLARE
lista SYS_REFCURSOR;
  idCultura cultura.id%TYPE;
  cultura1 cultura.planta%TYPE;
  soma INTEGER;
  ano INTEGER;
BEGIN
  lista := fncListaCulturasMaiorConsumoAgua(2023);

  LOOP
FETCH lista INTO idCultura, cultura1, soma, ano;
    EXIT WHEN lista%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Cultura = ' || cultura1 || ' minutos rega = ' || soma || ' ano = ' || ano);
END LOOP;

CLOSE lista;
END;
/
