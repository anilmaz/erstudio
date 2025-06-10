/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      HR Database
 *
 * Date Created : Tuesday, June 10, 2025 16:09:57
 * Target DBMS : Databricks
 */

/* 
 * TABLE: ADR 
 */

CREATE TABLE ADR
(
    ADRID       int         NOT NULL,
    ADRLINE1    string      NOT NULL,
    ADRLINE2    string,
    CITY        string,
    CTY         string,
    P_CDE       string      NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (ADRID) 
)
;

/* 
 * TABLE: AGY 
 */

CREATE TABLE AGY
(
    ID          int         NOT NULL,
    AGYNME      string,
    MAINCCT     string,
    CONTRACT    string,
    CONSTRAINT PK9 PRIMARY KEY (ID) 
)
;

/* 
 * TABLE: CNR 
 */

CREATE TABLE CNR
(
    EMPNMB      string             NOT NULL,
    DAYRAT      decimal(7, 0),
    AGENCYID    int                NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (EMPNMB) 
)
;

/* 
 * TABLE: DEP 
 */

CREATE TABLE DEP
(
    ID     string      NOT NULL,
    NME    string,
    CONSTRAINT PK7 PRIMARY KEY (ID) 
)
;

/* 
 * TABLE: EMP 
 */

CREATE TABLE EMP
(
    EMPNMB                      string              NOT NULL,
    EMPTYP                      string              NOT NULL,
    STTDTE                      date,
    PHONENMB                    decimal(15, 0),
    SLRY                        string,
    FRSNME                      string              NOT NULL,
    SURNAME                     string              NOT NULL,
    MEMBER                      string              NOT NULL,
    MANAGER                     string,
    ADRID                       int                 NOT NULL,
    `Performance Review Score`  int,
    `Promotion Flag`            boolean,
    `Commission Payment`        array<struct<
        `Commission Value`  int,
        Paid                boolean,
        `Payment Date`      date
    >>,
    CONSTRAINT PK1 PRIMARY KEY (EMPNMB) 
)
;

/* 
 * TABLE: EMPSKLMTX 
 */

CREATE TABLE EMPSKLMTX
(
    ID        string      NOT NULL,
    EMPNMB    string      NOT NULL,
    LVL       string,
    CONSTRAINT PK13 PRIMARY KEY (ID, EMPNMB) 
)
;

/* 
 * TABLE: FULL_TIMEEMP 
 */

CREATE TABLE FULL_TIMEEMP
(
    EMPNMB     string              NOT NULL,
    SALARY     decimal(10, 0),
    VCTDAYS    int,
    CONSTRAINT PK2 PRIMARY KEY (EMPNMB) 
)
;

/* 
 * TABLE: Order 
 */

CREATE TABLE Order
(
    `Order Number`                    string      NOT NULL,
    `Order Date`                      date,
    `Customer Purchase Order Number`  string,
    `Sales Person`                    string      NOT NULL,
    `Customer Reference Number`       string      NOT NULL,
    `Commission Payment`              array<struct<
        `Commission Value`  int,
        Paid                boolean,
        `Payment Date`      date
    >>,
    CONSTRAINT PK22 PRIMARY KEY (`Order Number`) 
)
;

/* 
 * TABLE: SKL 
 */

CREATE TABLE SKL
(
    ID     string      NOT NULL,
    NME    string      NOT NULL,
    DSP    string,
    CTY    string,
    CONSTRAINT PK5 PRIMARY KEY (ID) 
)
;

/* 
 * TABLE: `SKL TRGCRS` 
 */

CREATE TABLE `SKL TRGCRS`
(
    ID       string      NOT NULL,
    CRSID    string      NOT NULL
)
;

/* 
 * TABLE: TRGCRS 
 */

CREATE TABLE TRGCRS
(
    CRSID       string      NOT NULL,
    TITLE       string,
    SYNOPSIS    string,
    CONSTRAINT PK8 PRIMARY KEY (CRSID) 
)
;

/* 
 * TABLE: TRGHST 
 */

CREATE TABLE TRGHST
(
    EMPNMB           string      NOT NULL,
    CRSID            string      NOT NULL,
    COMPLETIONDTE    string,
    RESULT           string,
    CONSTRAINT PK12 PRIMARY KEY (EMPNMB, CRSID) 
)
;

