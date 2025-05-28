/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      HR Database
 *
 * Date Created : Wednesday, May 28, 2025 11:53:28
 * Target DBMS : Databricks
 */

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
    `Promotion Flag`            string,
    `Commission Payment`        array<struct<
        `Commission Value`  int,
        Paid                boolean,
        `Payment Date`      date
    >>,
    c1                          string,
    c2                          string,
    PRIMARY KEY (EMPNMB) 
)
;

