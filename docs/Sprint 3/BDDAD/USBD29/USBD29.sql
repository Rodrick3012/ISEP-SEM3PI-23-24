DROP TABLE tipoAlteracao CASCADE CONSTRAINTS;
DROP TABLE LogOperacoes CASCADE CONSTRAINTS;
DROP TABLE OperacaoFatorProducao CASCADE CONSTRAINTS;
DROP TABLE Operacao CASCADE CONSTRAINTS;
DROP TABLE FatorProducao CASCADE CONSTRAINTS;
DROP TABLE Fabricante CASCADE CONSTRAINTS;
DROP TABLE Formulacao CASCADE CONSTRAINTS;
DROP TABLE Classificacao CASCADE CONSTRAINTS;
DROP TABLE Objetivo CASCADE CONSTRAINTS;
DROP TABLE Parcela CASCADE CONSTRAINTS;
DROP TABLE IncorporacaoSolo CASCADE CONSTRAINTS;
DROP TABLE Cultura CASCADE CONSTRAINTS;
DROP TABLE planta CASCADE CONSTRAINTS;
DROP TABLE Especie CASCADE CONSTRAINTS;
DROP TABLE TipoPlanta CASCADE CONSTRAINTS;
DROP TABLE Poda CASCADE CONSTRAINTS;
DROP TABLE Colheita CASCADE CONSTRAINTS;
DROP TABLE OperacaoAplicacao CASCADE CONSTRAINTS;
DROP TABLE OperacaoFertilizacao CASCADE CONSTRAINTS;
DROP TABLE Modo CASCADE CONSTRAINTS;
DROP TABLE OperacaoRegaSetor CASCADE CONSTRAINTS;
DROP TABLE Setor CASCADE CONSTRAINTS;
DROP TABLE CulturaOperacaoFatorProducao CASCADE CONSTRAINTS;
DROP TABLE Plantacao CASCADE CONSTRAINTS;
DROP TABLE Semeadura CASCADE CONSTRAINTS;
DROP TABLE MobilizacaoSolo CASCADE CONSTRAINTS;
DROP TABLE Monda CASCADE CONSTRAINTS;
DROP TABLE Receita_FatorProducao CASCADE CONSTRAINTS;
DROP TABLE Unidade CASCADE CONSTRAINTS;
DROP TABLE plantaProduto CASCADE CONSTRAINTS;
DROP TABLE Produto CASCADE CONSTRAINTS;
DROP TABLE CulturaSetor CASCADE CONSTRAINTS;
DROP TABLE TipoPeriodo CASCADE CONSTRAINTS;
DROP TABLE Periodo CASCADE CONSTRAINTS;
DROP TABLE MedicaoSensor CASCADE CONSTRAINTS;
DROP TABLE Sensor CASCADE CONSTRAINTS;
DROP TABLE EstacaoMeteorologica CASCADE CONSTRAINTS;
DROP TABLE TipoSensor CASCADE CONSTRAINTS;
DROP TABLE Substancia CASCADE CONSTRAINTS;
DROP TABLE SubstanciaFatorProducao CASCADE CONSTRAINTS;
DROP TABLE Colheita_Produto CASCADE CONSTRAINTS;
DROP TABLE FatorProducaoPH CASCADE CONSTRAINTS;
DROP TABLE Quantidade CASCADE CONSTRAINTS;
DROP TABLE FatorProducao_Operacao CASCADE CONSTRAINTS;

CREATE TABLE tipoAlteracao
(
    id            NUMBER GENERATED AS IDENTITY,
    tipoAlteracao VARCHAR2(20) CONSTRAINT nn_tipoAlteracao NOT NULL,
    CONSTRAINT uq_tipoAlteracao UNIQUE (tipoAlteracao),
    CONSTRAINT pk_tipoAlteracao PRIMARY KEY (id)
);

CREATE TABLE LogOperacoes
(
    idLog                  NUMBER GENERATED AS IDENTITY CONSTRAINT pk_idLog PRIMARY KEY,
    idOperacao             NUMBER CONSTRAINT nn_idOperacao_LogOperacoes NOT NULL,
    estadoAnulacaoAnterior NUMBER(1) CONSTRAINT nn_estadoAnulacaoAnterior_LogOperacoes NOT NULL,
    dataOperacao           DATE CONSTRAINT nn_dataOperacao_LogOperacoes NOT NULL,
    dataAlteracao          TIMESTAMP(0) CONSTRAINT nn_dataAlteracao_LogOperacoes NOT NULL,
    tipoAlteracao          NUMBER CONSTRAINT nn_tipoAlteracao_LogOperacoes NOT NULL
);

CREATE TABLE OperacaoFatorProducao
(
    id            NUMBER CONSTRAINT pk_OperacaoFatorProducao PRIMARY KEY,
    parcela       VARCHAR2(25) CONSTRAINT nn_parcela_OperacaoFatorProducao NOT NULL,
    quantidade    NUMBER CONSTRAINT nn_quantidade_OperacaoFatorProducao NOT NULL
);
CREATE TABLE Operacao
(
    id      NUMBER CONSTRAINT pk_operacao PRIMARY KEY,
    anulada NUMBER DEFAULT 0 CONSTRAINT nn_anuladaOperacao NOT NULL,
    data    DATE CONSTRAINT nn_dataOperacao NOT NULL
);
CREATE TABLE FatorProducao
(
    designacao    varchar2(30),
    Fabricante    NUMBER CONSTRAINT nn_Fabricante_FatorProducao NOT NULL,
    formulacao    NUMBER CONSTRAINT nn_formulacao_FatorProducao NOT NULL,
    classificacao NUMBER CONSTRAINT nn_classificacao_FatorProducao NOT NULL,
    objetivo      NUMBER CONSTRAINT nn_objetivo_FatorProducao NOT NULL,
    CONSTRAINT pk_designacao PRIMARY KEY (designacao)
);

CREATE TABLE Fabricante
(
    id         number GENERATED AS IDENTITY CONSTRAINT pk_Fabricante PRIMARY KEY,
    Fabricante varchar2(30) CONSTRAINT nn_fabricante NOT NULL CONSTRAINT  uq_fabricante UNIQUE
);

CREATE TABLE Formulacao
(
    id         number GENERATED AS IDENTITY CONSTRAINT pk_Formulacao PRIMARY KEY,
    formulacao varchar2(30) CONSTRAINT nn_formulacao NOT NULL CONSTRAINT  uq_formulacao UNIQUE
);
CREATE TABLE Classificacao
(
    id            number GENERATED AS IDENTITY CONSTRAINT pk_Classificacao PRIMARY KEY,
    classificacao varchar2(30) CONSTRAINT nn_Classificacao NOT NULL CONSTRAINT  uq_Classificacao UNIQUE
);
CREATE TABLE Objetivo
(
    id       number GENERATED AS IDENTITY CONSTRAINT pk_Objetivo PRIMARY KEY,
    objetivo varchar2(40) CONSTRAINT nn_Objetivo NOT NULL CONSTRAINT  uq_Objetivo UNIQUE
);
CREATE TABLE Parcela
(
    designacao varchar2(25) CONSTRAINT pk_parcela PRIMARY KEY,
    area       number CONSTRAINT nn_area_parcela NOT NULL
    CONSTRAINT check_area_positive_Parcela CHECK (area > 0)
);

CREATE TABLE IncorporacaoSolo
(
    id      number CONSTRAINT pk_incorporacaoSolo PRIMARY KEY,
    area    number  CONSTRAINT nn_area_IncorporacaoSolo NOT NULL,
    Cultura number  CONSTRAINT nn_cultura_IncorporacaoSolo NOT NULL,
    CONSTRAINT check_area_positive_IncorporacaoSolo CHECK (area > 0)
);
CREATE TABLE Cultura
(
    id          number GENERATED AS IDENTITY,
    planta      number CONSTRAINT nn_planta_cultura NOT NULL,
    parcela     varchar2(25) CONSTRAINT nn_parcela_cultura NOT NULL,
    dataInicial date   CONSTRAINT nn_dataInicial_cultura NOT NULL,
    dataFinal  date,
    CONSTRAINT pk_Cultura primary key (id)
);
CREATE TABLE planta
(
    id        number GENERATED AS IDENTITY,
    Variedade varchar2(50) CONSTRAINT nn_variedade_planta NOT NULL,
    nomeComum varchar2(30) CONSTRAINT nn_nomeComum_planta NOT NULL,
    Especieid number CONSTRAINT nn_especieId_planta NOT NULL,
    CONSTRAINT pk_planta PRIMARY KEY (id),
    CONSTRAINT uq_variedade_nomeComum UNIQUE (Variedade, nomeComum)

);
CREATE TABLE Especie
(
    id           number GENERATED AS IDENTITY,
    designacao   varchar2(40) CONSTRAINT nn_designacao_especie NOT NULL CONSTRAINT uq_designacao_especie UNIQUE,
    TipoPlantaid number CONSTRAINT nn_tipoPlantaId_especie NOT NULL,
    CONSTRAINT pk_especie PRIMARY KEY (id)
);
CREATE TABLE TipoPlanta
(
    id         number GENERATED AS IDENTITY,
    tipoPlanta varchar2(30) CONSTRAINT nn_tipoPlanta NOT NULL CONSTRAINT uq_tipoPlanta UNIQUE,
    CONSTRAINT pk_tipoPlanta PRIMARY KEY (id)
);

CREATE TABLE Poda
(
    id         number,
    cultura    number CONSTRAINT nn_cultura_poda NOT NULL,
    quantidade number CONSTRAINT nn_quantidade_poda NOT NULL,
    CONSTRAINT pk_poda PRIMARY KEY (id)
);
CREATE TABLE Colheita
(
    id         number,
    Cultura    number CONSTRAINT nn_cultura_Colheita NOT NULL,
    quantidade number CONSTRAINT nn_quantidade_Colheita NOT NULL,
    CONSTRAINT check_quantidade_positive_Colheita CHECK (quantidade > 0),
    CONSTRAINT pk_colheita PRIMARY KEY (id)
);
CREATE TABLE OperacaoAplicacao
(
    id number NOT NULL,
    CONSTRAINT pk_operacaoAplicacao PRIMARY KEY (id)
);
CREATE TABLE OperacaoFertilizacao
(
    id   number ,
    modo number CONSTRAINT nn_modo NOT NULL,
    CONSTRAINT pk_operacaoFertilizacao PRIMARY KEY (id)
);
CREATE TABLE Modo
(
    id   number GENERATED AS IDENTITY,
    modo varchar2(20) NOT NULL UNIQUE,
    CONSTRAINT pk_modo PRIMARY KEY (id)
);


CREATE TABLE OperacaoRegaSetor
(
    id      number       ,
    duracao number       CONSTRAINT nn_duracaoOperacaoRegaSetor NOT NULL,
    horario timestamp(0) CONSTRAINT nn_horarioOperacaoRegaSetor NOT NULL,
    setor   varchar2(2) CONSTRAINT nn_setorOperacaoRegaSetor NOT NULL,
    CONSTRAINT pk_operacaoRegaSetor PRIMARY KEY (id)
);

CREATE TABLE Setor
(
    setor        varchar2(2) ,
    caudalMaximo number CONSTRAINT nn_caudalMaximo NOT NULL,
    dataInicio   date CONSTRAINT nn_dataInicio NOT NULL,
    dataFim      date,
    CONSTRAINT pk_setor PRIMARY KEY (setor)
);



CREATE TABLE CulturaOperacaoFatorProducao
(
    OperacaoFatorProducao number ,
    Cultura               number CONSTRAINT nn_culturaOpFp NOT NULL,
    CONSTRAINT pk_culturaOperacaoFatorProducao PRIMARY KEY (OperacaoFatorProducao)
);

CREATE TABLE Plantacao
(
    id         number ,
    Cultura    number CONSTRAINT nn_culturaPlantacao NOT NULL,
    quantidade number(10) CONSTRAINT nn_quantidadePlantacao NOT NULL,
    CONSTRAINT check_quantidade_positive_Plantacao CHECK (quantidade > 0),
    CONSTRAINT pk_plantacao PRIMARY KEY (id)
);

CREATE TABLE Semeadura
(
    id         number ,
    Cultura    number CONSTRAINT nn_culturaSemeadura NOT NULL,
    area       number(10) CONSTRAINT nn_areaSemeadura NOT NULL,
    quantidade number(10) CONSTRAINT nn_quantidadeSemeadura NOT NULL,
    CONSTRAINT check_area_positive_semeadura CHECK (area >= 0),
    CONSTRAINT pk_semeadura PRIMARY KEY (id)
);

CREATE TABLE MobilizacaoSolo
(
    id      number ,
    area    number(10) CONSTRAINT nn_areaMobilizacaoSolo NOT NULL,
    parcela varchar2(25) CONSTRAINT nn_parcelaMobilizacaoSolo NOT NULL,
    CONSTRAINT check_area_positive_MobilizacaoSolo CHECK (area > 0),
    CONSTRAINT pk_mobilizacaoSolo PRIMARY KEY (id)
);

CREATE TABLE Monda
(
    id      number ,
    Cultura number CONSTRAINT nn_culturaMonda NOT NULL,
    area    number(10) CONSTRAINT nn_areaMonda NOT NULL,
    CONSTRAINT check_area_positive_monda CHECK (area > 0),
    CONSTRAINT pk_monda PRIMARY KEY (id)
);

CREATE TABLE Receita_FatorProducao
(
    idReceita number,
    FatorProducao varchar2(30) CONSTRAINT nn_fatorProducao_Receita_FatorProducao NOT NULL,
    quantidade    number(10) CONSTRAINT nn_quantidade_Receita_FatorProducao NOT NULL CONSTRAINT check_receita_quantidade_positive CHECK ( quantidade>0 ),
    Unidade       number CONSTRAINT nn_unidade_Receita_FatorProducao NOT NULL,
    CONSTRAINT pk_Receita_FatorProducao PRIMARY KEY (idReceita,
                 FatorProducao)
);
CREATE TABLE Unidade
(
    id         number GENERATED AS IDENTITY,
    designacao varchar2(10) CONSTRAINT nn_designacaoUnidade NOT NULL  CONSTRAINT uq_designacao UNIQUE,
    CONSTRAINT pk_unidade PRIMARY KEY (id)
);
CREATE TABLE plantaProduto
(
    produto number ,
    planta  number ,
    CONSTRAINT pk_plantaProduto PRIMARY KEY (produto,
                 planta)
);
CREATE TABLE Produto
(
    id      number GENERATED AS IDENTITY,
    produto varchar2(30) CONSTRAINT nn_produto NOT NULL CONSTRAINT uq_produto UNIQUE,
    CONSTRAINT pk_produto PRIMARY KEY (id)
);
CREATE TABLE CulturaSetor
(
    id           number GENERATED AS IDENTITY,
    setor        varchar2(2) CONSTRAINT nn_setor NOT NULL,
    Cultura      number CONSTRAINT nn_culturaSetor NOT NULL,
    quantidade   number CONSTRAINT nn_quantidadeCulturaSetor NOT NULL,
    dataInsercao date  CONSTRAINT nn_dataInsercao NOT NULL,
    dataRemocao  date,
    CONSTRAINT check_quantidade_positive_CulturaSetor CHECK (quantidade > 0),
    CONSTRAINT pk_culturaSetor PRIMARY KEY (id)
);
CREATE TABLE TipoPeriodo
(
    id          number GENERATED AS IDENTITY,
    tipoPeriodo varchar2(30) CONSTRAINT nn_tipoPeriodo NOT NULL CONSTRAINT uq_tipoPeriodo UNIQUE,
    CONSTRAINT pk_tipoPeriodo PRIMARY KEY (id)
);

CREATE TABLE Periodo
(
    id      number GENERATED AS IDENTITY,
    periodo varchar2(50) CONSTRAINT nn_periodo NOT NULL,
    tipo    number CONSTRAINT nn_tipo NOT NULL,
    planta  number CONSTRAINT nn_planta NOT NULL,
    CONSTRAINT pk_periodo PRIMARY KEY (id)
);

CREATE TABLE MedicaoSensor
(
    idSensor    number ,
    ValorMedido number CONSTRAINT nn_valorMedido NOT NULL,
    CONSTRAINT pk_medicaoSensor PRIMARY KEY (idSensor)
);

CREATE TABLE Sensor
(
    id         number GENERATED AS IDENTITY,
    Estacao    varchar2(40) CONSTRAINT nn_estacao NOT NULL,
    tipoSensor number CONSTRAINT nn_tipoSensor_Sensor NOT NULL,
    parcela    varchar2(25) CONSTRAINT nn_parcelaSensor NOT NULL,
    CONSTRAINT pk_sensor PRIMARY KEY (id)
);

CREATE TABLE EstacaoMeteorologica
(
    designacao  varchar2(40),
    localizacao varchar2(50) CONSTRAINT nn_localizacao NOT NULL,
    CONSTRAINT pk_estacaoMeteorologic PRIMARY KEY (designacao)
);

CREATE TABLE TipoSensor
(
    idTipo number GENERATED AS IDENTITY,
    tipo   varchar2(30) CONSTRAINT nn_tipoSensor NOT NULL CONSTRAINT uq_tipoSensor UNIQUE,
    CONSTRAINT pk_tipoSensor PRIMARY KEY (idTipo)
);
CREATE TABLE Substancia
(
    id         number GENERATED AS IDENTITY,
    substancia varchar2(50) CONSTRAINT nn_substancia NOT NULL CONSTRAINT uq_substancia UNIQUE,
    CONSTRAINT pk_substancia PRIMARY KEY (id)
);
CREATE TABLE SubstanciaFatorProducao
(
    substancia    number ,
    fatorProducao varchar2(30) ,
    percentagem   number CONSTRAINT nn_percentagem NOT NULL,
    CONSTRAINT pk_substanciaFatorProducao PRIMARY KEY (substancia,
                 fatorProducao)
);
CREATE TABLE Colheita_Produto
(
    Colheitaid number ,
    Produtoid  number ,
    CONSTRAINT pk_colheitaProduto PRIMARY KEY (Colheitaid,
                 Produtoid)
);
CREATE TABLE FatorProducao_Operacao
(
    idOperacao number ,
    fatorProducao  varchar2(30) ,
    CONSTRAINT pk_colheitaProdutoFatorProducao_Operacao PRIMARY KEY (idOperacao,
                                               fatorProducao)
);
CREATE TABLE FatorProducaoPH
(
    fatorProducao varchar2(30) ,
    Ph            number CONSTRAINT nn_ph  NOT NULL,
    CONSTRAINT pk_fatorProducaoPh PRIMARY KEY (fatorProducao)
);

CREATE TABLE Quantidade
(
    cultura    number ,
    unidade    number CONSTRAINT nn_unidade NOT NULL,
    quantidade number CONSTRAINT nn_quantidade NOT NULL,
    CONSTRAINT check_quantidade_positiveCultura CHECK (quantidade > 0),
    CONSTRAINT pk_quantidadeCultura PRIMARY KEY (cultura,
                 unidade)
);

ALTER TABLE LogOperacoes
    ADD CONSTRAINT FKLogOperaco411938 FOREIGN KEY (tipoAlteracao) REFERENCES tipoAlteracao (id);
ALTER TABLE OperacaoFatorProducao
    ADD CONSTRAINT FKOperacaoFa39367 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE FatorProducao
    ADD CONSTRAINT FKFatorProdu762811 FOREIGN KEY (objetivo) REFERENCES Objetivo (id);
ALTER TABLE OperacaoFatorProducao
    ADD CONSTRAINT FKOperacaoFa567047 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE IncorporacaoSolo
    ADD CONSTRAINT FKIncorporac414313 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE IncorporacaoSolo
    ADD CONSTRAINT FKIncorporac202557 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Cultura
    ADD CONSTRAINT FKCultura605439 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE planta
    ADD CONSTRAINT FKplanta165264 FOREIGN KEY (Especieid) REFERENCES Especie (id);
ALTER TABLE Especie
    ADD CONSTRAINT FKEspecie960694 FOREIGN KEY (TipoPlantaid) REFERENCES TipoPlanta (id);
ALTER TABLE Cultura
    ADD CONSTRAINT FKCultura155084 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Poda
    ADD CONSTRAINT FKPoda426785 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Poda
    ADD CONSTRAINT FKPoda869973 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE Colheita
    ADD CONSTRAINT FKColheita943585 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Colheita
    ADD CONSTRAINT FKColheita268170 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE OperacaoAplicacao
    ADD CONSTRAINT FKOperacaoAp303441 FOREIGN KEY (id) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE OperacaoFertilizacao
    ADD CONSTRAINT FKOperacaoFe880318 FOREIGN KEY (id) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE OperacaoFertilizacao
    ADD CONSTRAINT FKOperacaoFe3347 FOREIGN KEY (modo) REFERENCES Modo (id);
ALTER TABLE OperacaoRegaSetor
    ADD CONSTRAINT FKOperacaoRe730827 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE OperacaoRegaSetor
    ADD CONSTRAINT FKOperacaoRe376754 FOREIGN KEY (setor) REFERENCES Setor (setor);
ALTER TABLE CulturaOperacaoFatorProducao
    ADD CONSTRAINT FKCulturaOpe323177 FOREIGN KEY (OperacaoFatorProducao) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE CulturaOperacaoFatorProducao
    ADD CONSTRAINT FKCulturaOpe850504 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Plantacao
    ADD CONSTRAINT FKPlantacao567054 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Plantacao
    ADD CONSTRAINT FKPlantacao644701 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Semeadura
    ADD CONSTRAINT FKSemeadura275244 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Semeadura
    ADD CONSTRAINT FKSemeadura484590 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE MobilizacaoSolo
    ADD CONSTRAINT FKMobilizaca220351 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE MobilizacaoSolo
    ADD CONSTRAINT FKMobilizaca144825 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE Monda
    ADD CONSTRAINT FKMonda393036 FOREIGN KEY (id) REFERENCES Operacao (id);
ALTER TABLE Monda
    ADD CONSTRAINT FKMonda818719 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Receita_FatorProducao
    ADD CONSTRAINT Receita_FatorProducao_idReceitaID FOREIGN KEY (idReceita) REFERENCES MixFertirrega (id);
ALTER TABLE Receita_FatorProducao
    ADD CONSTRAINT FKMixFertirr220075 FOREIGN KEY (FatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE Receita_FatorProducao
    ADD CONSTRAINT FKMixFertirr351504 FOREIGN KEY (Unidade) REFERENCES Unidade (id);
ALTER TABLE plantaProduto
    ADD CONSTRAINT FKplantaProd874382 FOREIGN KEY (produto) REFERENCES Produto (id);
ALTER TABLE plantaProduto
    ADD CONSTRAINT FKplantaProd610790 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE CulturaSetor
    ADD CONSTRAINT FKCulturaSet575296 FOREIGN KEY (setor) REFERENCES Setor (setor);
ALTER TABLE CulturaSetor
    ADD CONSTRAINT FKCulturaSet432979 FOREIGN KEY (Cultura) REFERENCES Cultura (id);
ALTER TABLE Periodo
    ADD CONSTRAINT FKPeriodo235042 FOREIGN KEY (tipo) REFERENCES TipoPeriodo (id);
ALTER TABLE Periodo
    ADD CONSTRAINT FKPeriodo609572 FOREIGN KEY (planta) REFERENCES planta (id);
ALTER TABLE Sensor
    ADD CONSTRAINT FKSensor671518 FOREIGN KEY (Estacao) REFERENCES EstacaoMeteorologica (designacao);
ALTER TABLE Sensor
    ADD CONSTRAINT FKSensor396405 FOREIGN KEY (parcela) REFERENCES Parcela (designacao);
ALTER TABLE SubstanciaFatorProducao
    ADD CONSTRAINT FKSubstancia885676 FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE Colheita_Produto
    ADD CONSTRAINT FKColheita_P599783 FOREIGN KEY (Colheitaid) REFERENCES Colheita (id);
ALTER TABLE Colheita_Produto
    ADD CONSTRAINT FKColheita_P165515 FOREIGN KEY (Produtoid) REFERENCES Produto (id);
ALTER TABLE FatorProducaoPH
    ADD CONSTRAINT FKFatorProdu315394 FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
ALTER TABLE Quantidade
    ADD CONSTRAINT FKQuantidade768256 FOREIGN KEY (cultura) REFERENCES Cultura (id);
ALTER TABLE Quantidade
    ADD CONSTRAINT FKQuantidade252813 FOREIGN KEY (unidade) REFERENCES Unidade (id);
ALTER TABLE FatorProducao_Operacao
    ADD CONSTRAINT FKOperacaoID FOREIGN KEY (idOperacao) REFERENCES OperacaoFatorProducao (id);
ALTER TABLE FatorProducao_Operacao
    ADD CONSTRAINT FKFatorProducaoDesignacao FOREIGN KEY (fatorProducao) REFERENCES FatorProducao (designacao);
