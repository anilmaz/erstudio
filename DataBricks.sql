--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      SampleModel.DM1
--
-- Date Created : Wednesday, April 30, 2025 17:09:58
-- Target DBMS : Snowflake
--

-- 
-- TABLE: ADR 
--

CREATE TABLE ADR(
    ADR_ID      CHAR(10)    NOT NULL,
    ADR_LN_1    CHAR(10),
    ADR_LN_2    CHAR(10),
    CTY         CHAR(10),
    PST_CDE     CHAR(10),
    CTY_1       CHAR(10),
    CONSTRAINT PK4 PRIMARY KEY (ADR_ID) NOT DEFERRABLE 
)
;



-- 
-- TABLE: AGY 
--

CREATE TABLE AGY(
    ID          CHAR(10)    NOT NULL,
    AGY_NME     CHAR(10),
    MAIN_CCT    CHAR(10),
    CONTRACT    CHAR(10),
    CONSTRAINT PK9 PRIMARY KEY (ID) NOT DEFERRABLE 
)
;



-- 
-- TABLE: CNR 
--

CREATE TABLE CNR(
    EMP_NMB     CHAR(10)    NOT NULL,
    DAY_RAT     CHAR(10),
    AGENCYID    CHAR(10)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (EMP_NMB) NOT DEFERRABLE 
)
;



-- 
-- TABLE: DEP 
--

CREATE TABLE DEP(
    ID     CHAR(10)    NOT NULL,
    NME    CHAR(10),
    CONSTRAINT PK7 PRIMARY KEY (ID) NOT DEFERRABLE 
)
;



-- 
-- TABLE: EMP 
--

CREATE TABLE EMP(
    EMP_NMB      CHAR(10)         NOT NULL,
    EMP_TYP      CHAR(1)          NOT NULL,
    STT_DTE      DATE,
    PHONE_NMB    NUMBER(15, 0),
    FRS_NME      CHAR(10)         NOT NULL,
    SURNAME      CHAR(10)         NOT NULL,
    MEMBER       CHAR(10)         NOT NULL,
    MANAGER      CHAR(10),
    ADR_ID       CHAR(10)         NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (EMP_NMB) NOT DEFERRABLE 
)
;



-- 
-- TABLE: EMP_SKL_MTX 
--

CREATE TABLE EMP_SKL_MTX(
    ID         CHAR(10)    NOT NULL,
    EMP_NMB    CHAR(10)    NOT NULL,
    LVL        CHAR(10),
    CONSTRAINT PK13 PRIMARY KEY (ID, EMP_NMB) NOT DEFERRABLE 
)
;



-- 
-- TABLE: FULL_TIME_EMP 
--

CREATE TABLE FULL_TIME_EMP(
    EMP_NMB     CHAR(10)    NOT NULL,
    SALARY      CHAR(10),
    VCT_DAYS    CHAR(10),
    CONSTRAINT PK2 PRIMARY KEY (EMP_NMB) NOT DEFERRABLE 
)
;



-- 
-- TABLE: SKL 
--

CREATE TABLE SKL(
    ID     CHAR(10)    NOT NULL,
    NME    CHAR(10)    NOT NULL,
    DSP    CHAR(10),
    CTY    CHAR(10),
    CONSTRAINT PK5 PRIMARY KEY (ID) NOT DEFERRABLE 
)
;



-- 
-- TABLE: "SKL TRG_CRS" 
--

CREATE TABLE "SKL TRG_CRS"(
    ID        CHAR(10)    NOT NULL,
    CRS_ID    CHAR(10)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (ID, CRS_ID) NOT DEFERRABLE 
)
;



-- 
-- TABLE: TRG_CRS 
--

CREATE TABLE TRG_CRS(
    CRS_ID      CHAR(10)    NOT NULL,
    TITLE       CHAR(10),
    SYNOPSIS    CHAR(10),
    CONSTRAINT PK8 PRIMARY KEY (CRS_ID) NOT DEFERRABLE 
)
;



-- 
-- TABLE: TRG_HST 
--

CREATE TABLE TRG_HST(
    EMP_NMB           CHAR(10)    NOT NULL,
    CRS_ID            CHAR(10)    NOT NULL,
    COMPLETION_DTE    CHAR(10),
    RESULT            CHAR(10),
    CONSTRAINT PK12 PRIMARY KEY (EMP_NMB, CRS_ID) NOT DEFERRABLE 
)
;



