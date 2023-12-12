CREATE OR REPLACE TRIGGER setIdNext
BEFORE INSERT ON Operacao
FOR EACH ROW
DECLARE
oldID number;
    newID number;
BEGIN
SELECT NVL(MAX(ID), 0) INTO oldId FROM operacao;
newID := oldId + 1;
    :NEW.ID := newID;
END;
