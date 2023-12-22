--AS OBJECT indica explicitamente que estamos a criar um tipo de objeto, que é uma estrutura de dados composta por atributos senão o Oracle vai assumir que estmamos a criar um tipo de coleção, como um tipo de tabela ou numeros
CREATE OR REPLACE TYPE FatorProducaoType AS OBJECT (
    nome VARCHAR2(50),
    quantidade NUMBER,
    unidade_id NUMBER
);

--Criacao de um tipo de tabela com o tipo presente em cima
CREATE OR REPLACE TYPE FatoresProducaoArrayType AS TABLE OF FatorProducaoType;
/


CREATE OR REPLACE PROCEDURE PCD_REGISTAR_RECEITA_FERTIRREGA(
    pReceitaID NUMBER,
    pFatoresProducao FatoresProducaoArrayType
) AS
BEGIN
INSERT INTO mixFertirrega VALUES (pReceitaID);

--vai iterar de 1 ate pFatoresProducao.Count(retorna o numero de elementos no array)
FOR i IN 1..pFatoresProducao.COUNT LOOP
        INSERT INTO mixFertirrega_fatorProducao (mixFertirrega, fatorProducao, Quantidade, unidade)
        VALUES (pReceitaID, pFatoresProducao(i).nome, pFatoresProducao(i).quantidade, pFatoresProducao(i).unidade_id);
END LOOP;
END;
/


DECLARE
    -- Declaração de variáveis
receita_id NUMBER;
    fatores_producao FatoresProducaoArrayType;
BEGIN
    -- Inicializar variáveis
    receita_id := 1; 
    fatores_producao := FatoresProducaoArrayType();
    
    -- .extend serve para adicionar dinamicamente espaço para mais 2 fatorProducaoType no array
    fatores_producao.EXTEND(2);
    -- Adicionar elementos ao array
    fatores_producao(1) := FatorProducaoType('BIOFERTIL N6', 100, 3);
    fatores_producao(2) := FatorProducaoType('soluSOP 52', 50, 4);  
    
    -- Chamar a procedure
    PCD_REGISTAR_RECEITA_FERTIRREGA(receita_id, fatores_producao);
    
    
    
    -- Exibir mensagem de sucesso
    DBMS_OUTPUT.PUT_LINE('Procedure executada com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        -- Exibir mensagem de erro
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
ROLLBACK;
END;
/