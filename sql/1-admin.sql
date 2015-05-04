drop table EPTD_CARGA_LOG;
drop table EPTD_CARGA_BIT;
CREATE TABLE EPTD_CARGA_BIT (
  ID_CARGA NUMBER(10,0) NOT NULL,
  COD_CLIE NUMBER(10,0),
  COD_SEGM NUMBER(10,0),
  NOM_ARCHIVO VARCHAR2(200 BYTE) NOT NULL,
  NOM_ARCH_CLI VARCHAR2(200 BYTE) NOT NULL,
  EST_ENVIO VARCHAR2(2 BYTE),
  FEC_ENVIO DATE,
  TIP_ENVIO VARCHAR2(20 BYTE),
  RES_STATUS VARCHAR(1),
  FEC_FIN DATE,
  FLG_VISTO CHAR(1)
)TABLESPACE EPM_MSG_DATA ;
ALTER TABLE EPTD_CARGA_BIT ADD CONSTRAINT EPTD_CARGA_BIT_PK PRIMARY KEY (ID_CARGA);

CREATE TABLE EPTD_CARGA_LOG(
  ID_INT INTEGER,
  ID_CARGA NUMBER(10,0),
  NUM_LNEA INTEGER,
  MSG_ERROR VARCHAR(2000)
)TABLESPACE EPM_MSG_DATA ; 


ALTER TABLE EPTD_CARGA_LOG ADD CONSTRAINT EPTD_CARGA_LOG_PK PRIMARY KEY (ID_INT);
ALTER TABLE EPTD_CARGA_LOG ADD FOREIGN KEY (ID_CARGA) REFERENCES EPTD_CARGA_BIT(ID_CARGA);

CREATE SEQUENCE SEQ_EPTD_SEGM_SUJE_CLIE START WITH 106000 INCREMENT BY 1;
CREATE SEQUENCE SQ_EPMC_CLIE_SUJE_0001 START WITH 267000 INCREMENT BY 1;
CREATE SEQUENCE SQ_EPMC_SUJE_0001 START WITH 265000 INCREMENT BY 1;
CREATE SEQUENCE SQ_EPTD_CARGA_BIT_0001 INCREMENT BY 1 START WITH 1;
CREATE INDEX FK_EPM_CLIE_IDX ON EPMC_SEGM (COD_CLIE ASC);
CREATE SEQUENCE HIBERNATE_SEQUENCE INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

-- Drop table EPTD_CLIE_SUJE_TIPO_SCOR
DROP TABLE EPTD_CLIE_SUJE_TIPO_SCOR;

-- Alter table EPMC_SEGM
ALTER TABLE EPMC_SEGM 
ADD (COD_CLIE NUMBER(10));

ALTER TABLE EPMC_SEGM  
MODIFY (TXT_NOMB VARCHAR2(1000 BYTE) );