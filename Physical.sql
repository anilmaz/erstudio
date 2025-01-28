/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      DATA MODEL
 *
 * Date Created : Tuesday, January 28, 2025 13:20:31
 * Target DBMS : Google BigQuery
 */

/* 
 * TABLE: CNR 
 */

CREATE TABLE CNR(
    EMPNMB         STRING(12)          NOT NULL,
    DAYRAT         BIGNUMERIC(7, 0),
    AGENCYID       INTEGER             NOT NULL,
    EXTERNALAGY    ARRAY<STRUCT<
        ID          INTEGER         NOT NULL,
        AGYNME      STRING(10),
        MAINCCT     STRING(100),
        CONTRACT    STRING(1000)
    >>
)
OPTIONS( 
    friendly_name = "Contractor"
)
;

/* 
 * TABLE: DEP 
 */

CREATE TABLE DEP(
    ID     STRING(10)    NOT NULL,
    NME    STRING(10)
)
OPTIONS( 
    friendly_name = "Department"
)
;

/* 
 * TABLE: EMP 
 */

CREATE TABLE EMP(
    EMPNMB       STRING(12)           NOT NULL,
    DemoCol      STRING(10),
    EMPTYP       STRING(1)            NOT NULL,
    GNDR         STRING(100),
    STTDTE       DATE,
    PHONENMB     BIGNUMERIC(15, 0),
    SLRY         NUMERIC(10, 0),
    FRSNME       STRING(200)          NOT NULL,
    SURNAME      STRING(200)          NOT NULL,
    MEMBER       STRING(10)           NOT NULL,
    MANAGER      STRING(10),
    ADRID        INTEGER              NOT NULL,
    NINO         STRING(15)           NOT NULL,
    NK_NME       STRING(10),
    NK_PHN       STRING(15),
    ADR          ARRAY<STRUCT<
        ADRID       INTEGER        NOT NULL,
        ADRLINE1    STRING(100)    NOT NULL,
        ADRLINE2    STRING(100),
        CITY        STRING(100),
        POSTCODE    STRING(12),
        CTY         STRING(3)      NOT NULL
    >>,
    EMPSKLMTX    ARRAY<STRUCT<
        ID     STRING(10)    NOT NULL,
        LVL    STRING(10)
    >>
)
CLUSTER BY
 MANAGER 

OPTIONS( 
    friendly_name = "Employee"
)
;

/* 
 * TABLE: FULL_TIMEEMP 
 */

CREATE TABLE FULL_TIMEEMP(
    EMPNMB     STRING(12)        NOT NULL,
    SALARY     NUMERIC(10, 0),
    VCTDAYS    INTEGER,
    TRGHST     ARRAY<STRUCT<
        CRSID            STRING(10)    NOT NULL,
        COMPLETIONDTE    STRING(10),
        RESULT           STRING(10)
    >>
)
OPTIONS( 
    friendly_name = "Full-Time Employee"
)
;

/* 
 * TABLE: SKL 
 */

CREATE TABLE SKL(
    ID     STRING(10)    NOT NULL,
    NME    STRING(10)    NOT NULL,
    DSP    STRING(10),
    CTY    STRING(10)
)
OPTIONS( 
    friendly_name = "Skill"
)
;

/* 
 * TABLE: TRGCRS 
 */

CREATE TABLE TRGCRS(
    CRSID       STRING(10)    NOT NULL,
    TITLE       STRING(10),
    SYNOPSIS    STRING(10),
    Skills      STRUCT<
        ID    STRING(10)    NOT NULL
    >
)
OPTIONS( 
    friendly_name = "Training Course"
)
;

