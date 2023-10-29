DROP TABLE OperacaoFatorProducao CASCADE CONSTRAINTS;
DROP TABLE Unidade CASCADE CONSTRAINTS;
DROP TABLE Parcela CASCADE CONSTRAINTS;
DROP TABLE modo CASCADE CONSTRAINTS;
DROP TABLE FatorProducao CASCADE CONSTRAINTS;
DROP TABLE Fabricante CASCADE CONSTRAINTS;
DROP TABLE Formulacao CASCADE CONSTRAINTS;
DROP TABLE Classificacao CASCADE CONSTRAINTS;
DROP TABLE Objetivo CASCADE CONSTRAINTS;
DROP TABLE Cultura CASCADE CONSTRAINTS;
DROP TABLE planta CASCADE CONSTRAINTS;
DROP TABLE TipoPlanta CASCADE CONSTRAINTS;
DROP TABLE dataColheita CASCADE CONSTRAINTS;
DROP TABLE dataFloracao CASCADE CONSTRAINTS;
DROP TABLE dataPoda CASCADE CONSTRAINTS;
DROP TABLE dataSementeira CASCADE CONSTRAINTS;
DROP TABLE cargoUtilizador CASCADE CONSTRAINTS;
DROP TABLE Utilizadores CASCADE CONSTRAINTS;
DROP TABLE Operacao CASCADE CONSTRAINTS;
DROP TABLE TipoOperacao CASCADE CONSTRAINTS;
DROP TABLE MedicaoSensor CASCADE CONSTRAINTS;
DROP TABLE Sensor CASCADE CONSTRAINTS;
DROP TABLE EstacaoMeteorologica CASCADE CONSTRAINTS;
DROP TABLE TipoSensor CASCADE CONSTRAINTS;
DROP TABLE Edificio CASCADE CONSTRAINTS;
DROP TABLE Substancia CASCADE CONSTRAINTS;
DROP TABLE ColheitaPrevista CASCADE CONSTRAINTS;
DROP TABLE FichaTecnica CASCADE CONSTRAINTS;
CREATE TABLE OperacaoFatorProducao (
  id            number GENERATED AS IDENTITY, 
  data          date NOT NULL, 
  quantidade    number NOT NULL, 
  unidade       number NOT NULL, 
  parcela       varchar2(255) NOT NULL, 
  modo          number NOT NULL, 
  fatorproducao varchar2(255) NOT NULL, 
  cultura       number, 
  tipooperacao  number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Unidade (
  id      number GENERATED AS IDENTITY, 
  unidade varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Parcela (
  designacao varchar2(255) NOT NULL, 
  area       number NOT NULL, 
  PRIMARY KEY (designacao));
CREATE TABLE modo (
  id   number GENERATED AS IDENTITY, 
  modo varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE FatorProducao (
  designacao    varchar2(255) NOT NULL, 
  Fabricante    number NOT NULL, 
  formulacao    number NOT NULL, 
  classificacao number NOT NULL, 
  objetivo      number NOT NULL, 
  PRIMARY KEY (designacao));
CREATE TABLE Fabricante (
  id         number GENERATED AS IDENTITY, 
  Fabricante varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Formulacao (
  id         number GENERATED AS IDENTITY, 
  formulacao varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Classificacao (
  id            number GENERATED AS IDENTITY, 
  classificacao varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Objetivo (
  id       number GENERATED AS IDENTITY, 
  objetivo varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Cultura (
  id          number GENERATED AS IDENTITY, 
  Parcela     varchar2(255) NOT NULL, 
  planta      number NOT NULL, 
  dataInicial date NOT NULL, 
  dataFinal   date, 
  quantidade  number NOT NULL, 
  Unidade     number NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE planta (
  id         number GENERATED AS IDENTITY, 
  nomeComum  varchar2(255) NOT NULL, 
  Variedade  varchar2(255) NOT NULL, 
  especie    varchar2(255) NOT NULL, 
  tipoplanta number NOT NULL, 
  produto    varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE TipoPlanta (
  id         number GENERATED AS IDENTITY, 
  tipoPLanta varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id));
CREATE TABLE dataColheita (
  planta       number NOT NULL, 
  dataColheita varchar2(255) NOT NULL, 
  PRIMARY KEY (planta, 
  dataColheita));
CREATE TABLE dataFloracao (
  planta       number NOT NULL, 
  dataFloracao varchar2(255) NOT NULL, 
  PRIMARY KEY (planta, 
  dataFloracao));
CREATE TABLE dataPoda (
  planta   number NOT NULL, 
  dataPoda varchar2(255) NOT NULL, 
  PRIMARY KEY (planta, 
  dataPoda));
CREATE TABLE dataSementeira (
  planta         number NOT NULL, 
  dataSementeira varchar2(255) NOT NULL, 
  PRIMARY KEY (planta, 
  dataSementeira));
CREATE TABLE cargoUtilizador (
  id    number GENERATED AS IDENTITY, 
  cargo varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE Utilizadores (
  cartaoCidadao number GENERATED AS IDENTITY, 
  nome          number NOT NULL, 
  cargo         number NOT NULL, 
  PRIMARY KEY (cartaoCidadao));
CREATE TABLE Operacao (
  id           number GENERATED AS IDENTITY, 
  TipoOperacao number NOT NULL, 
  data         date NOT NULL, 
  quantidade   number NOT NULL, 
  unidade      number, 
  cultura      number NOT NULL, 
  parcela      varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE TipoOperacao (
  id           number GENERATED AS IDENTITY, 
  tipoOperacao varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE MedicaoSensor (
  idSensor    number NOT NULL, 
  ValorMedido number NOT NULL, 
  unidade     number NOT NULL, 
  PRIMARY KEY (idSensor));
CREATE TABLE Sensor (
  id         number GENERATED AS IDENTITY, 
  Estacao    varchar2(255) NOT NULL, 
  tipoSensor number NOT NULL, 
  parcela    varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE EstacaoMeteorologica (
  designacao  varchar2(255) NOT NULL, 
  localizacao varchar2(255) NOT NULL, 
  PRIMARY KEY (designacao));
CREATE TABLE TipoSensor (
  idTipo number GENERATED AS IDENTITY, 
  tipo   varchar2(255) NOT NULL, 
  PRIMARY KEY (idTipo));
CREATE TABLE Edificio (
  designacao varchar2(255) NOT NULL, 
  area       number, 
  unidade    number, 
  PRIMARY KEY (designacao));
CREATE TABLE Substancia (
  id         number GENERATED AS IDENTITY, 
  substancia varchar2(255) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE ColheitaPrevista (
  id         number GENERATED AS IDENTITY, 
  idCultura  number NOT NULL, 
  semana     number NOT NULL, 
  quantidade number NOT NULL, 
  unidade    number NOT NULL, 
  CONSTRAINT id 
    PRIMARY KEY (id));
CREATE TABLE FichaTecnica (
  substancia    number NOT NULL, 
  fatorProducao varchar2(255) NOT NULL, 
  percentagem   varchar2(255) NOT NULL);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa538514 FOREIGN KEY (unidade) REFERENCES Unidade (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa567047 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa598132 FOREIGN KEY (modo) REFERENCES modo (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa455406 FOREIGN KEY (fatorproducao) REFERENCES FatorProducao (designacao);
ALTER TABLE FatorProducao ADD CONSTRAINT FKFatorProdu762811 FOREIGN KEY (objetivo) REFERENCES Objetivo (id);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa482555 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura499860 FOREIGN KEY (Parcela) REFERENCES Parcela (designacao);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura605439 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE dataColheita ADD CONSTRAINT FKdataColhei953525 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE dataFloracao ADD CONSTRAINT FKdataFlorac966254 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE dataPoda ADD CONSTRAINT FKdataPoda581097 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE dataSementeira ADD CONSTRAINT FKdataSement217167 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE Utilizadores ADD CONSTRAINT FKUtilizador292860 FOREIGN KEY (cargo) REFERENCES cargoUtilizador (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao305476 FOREIGN KEY (TipoOperacao) REFERENCES TipoOperacao (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao731299 FOREIGN KEY (unidade) REFERENCES Unidade (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao289770 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao240167 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor671518 FOREIGN KEY (Estacao) REFERENCES EstacaoMeteorologica (designacao);
ALTER TABLE MedicaoSensor ADD CONSTRAINT FKMedicaoSen553243 FOREIGN KEY (unidade) REFERENCES Unidade (id);
ALTER TABLE FichaTecnica ADD CONSTRAINT FKFichaTecni768445 FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE OperacaoFatorProducao ADD CONSTRAINT FKOperacaoFa148046 FOREIGN KEY (tipooperacao) REFERENCES TipoOperacao (id);
