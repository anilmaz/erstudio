--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      HR Database (logical complete).DM1
--
-- Date Created : Monday, February 17, 2025 21:23:20
-- Target DBMS : PostgreSQL 13.x-16.x
--

-- 
-- TABLE: "ADR" 
--

CREATE TABLE "ADR"(
    "ADRID"     integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "ADRLINE1"  varchar(100)    NOT NULL,
    "ADRLINE2"  varchar(100),
    "CITY"      varchar(100),
    "POSTCDE"   varchar(10),
    "CTY"       varchar(4),
    CONSTRAINT "PK4" PRIMARY KEY ("ADRID")
)
;



-- 
-- TABLE: "AGY" 
--

CREATE TABLE "AGY"(
    "ID"        integer          GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "AGYNME"    varchar(10),
    "MAINCCT"   varchar(100),
    "CONTRACT"  varchar(1000),
    CONSTRAINT "PK9" PRIMARY KEY ("ID")
)
;



-- 
-- TABLE: "CNR" 
--

CREATE TABLE "CNR"(
    "EMPNMB"    varchar(12)      NOT NULL,
    "DAYRAT"    numeric(7, 0),
    "AGENCYID"  integer          NOT NULL,
    CONSTRAINT "PK3" PRIMARY KEY ("EMPNMB")
)
;



-- 
-- TABLE: "DEP" 
--

CREATE TABLE "DEP"(
    "ID"   character(10)    NOT NULL,
    "NME"  character(10),
    CONSTRAINT "PK7" PRIMARY KEY ("ID")
)
;



-- 
-- TABLE: "EMP" 
--

CREATE TABLE "EMP"(
    "EMPNMB"    varchar(12)       NOT NULL,
    "EMPTYP"    character         NOT NULL,
    "STTDTE"    date,
    "PHONENMB"  numeric(15, 0),
    "FRSNME"    varchar(200)      NOT NULL,
    "SURNAME"   varchar(200)      NOT NULL,
    "MEMBER"    character(10)     NOT NULL,
    "MANAGER"   character(10),
    "ADRID"     integer           NOT NULL,
    CONSTRAINT "PK1" PRIMARY KEY ("EMPNMB")
)
;



-- 
-- TABLE: "EMPSKLMTX" 
--

CREATE TABLE "EMPSKLMTX"(
    "ID"      character(10)    NOT NULL,
    "EMPNMB"  varchar(12)      NOT NULL,
    "LVL"     character(10),
    CONSTRAINT "PK13" PRIMARY KEY ("ID", "EMPNMB")
)
;



-- 
-- TABLE: "FULL_TIMEEMP" 
--

CREATE TABLE "FULL_TIMEEMP"(
    "EMPNMB"   varchar(12)    NOT NULL,
    "SALARY"   money,
    "VCTDAYS"  integer,
    CONSTRAINT "PK2" PRIMARY KEY ("EMPNMB")
)
;



-- 
-- TABLE: "SKL" 
--

CREATE TABLE "SKL"(
    "ID"   character(10)    NOT NULL,
    "NME"  character(10)    NOT NULL,
    "DSP"  character(10),
    "CTY"  character(10),
    CONSTRAINT "PK5" PRIMARY KEY ("ID")
)
;



-- 
-- TABLE: "SKL TRGCRS" 
--

CREATE TABLE "SKL TRGCRS"(
    "ID"     character(10)    NOT NULL,
    "CRSID"  character(10)    NOT NULL,
    CONSTRAINT "PK14" PRIMARY KEY ("ID", "CRSID")
)
;



-- 
-- TABLE: "TRGCRS" 
--

CREATE TABLE "TRGCRS"(
    "CRSID"     character(10)    NOT NULL,
    "TITLE"     character(10),
    "SYNOPSIS"  character(10),
    CONSTRAINT "PK8" PRIMARY KEY ("CRSID")
)
;



-- 
-- TABLE: "TRGHST" 
--

CREATE TABLE "TRGHST"(
    "EMPNMB"         varchar(12)      NOT NULL,
    "CRSID"          character(10)    NOT NULL,
    "COMPLETIONDTE"  character(10),
    "RESULT"         character(10),
    CONSTRAINT "PK12" PRIMARY KEY ("EMPNMB", "CRSID")
)
;



-- 
-- VIEW: "VW_Employee" 
--

CREATE VIEW "VW_Employee"   AS
SELECT Em."EMPNMB", Em."EMPTYP", Em."STTDTE", Em."PHONENMB", Em."FRSNME", Em."SURNAME", Em."MANAGER", Fu."SALARY", Co."DAYRAT"
FROM "EMP" Em, FULL_TIMEEMP Fu, "CNR" Co
WHERE Fu."EMPNMB" = Em."EMPNMB" AND Co."EMPNMB" = Em."EMPNMB"
;

-- 
-- TABLE: "CNR" 
--

ALTER TABLE "CNR" ADD CONSTRAINT "FK" 
    FOREIGN KEY ("EMPNMB")
    REFERENCES "EMP"("EMPNMB")
;

ALTER TABLE "CNR" ADD CONSTRAINT "FK2" 
    FOREIGN KEY ("AGENCYID")
    REFERENCES "AGY"("ID")
;


-- 
-- TABLE: "EMP" 
--

ALTER TABLE "EMP" ADD CONSTRAINT "FK1" 
    FOREIGN KEY ("ADRID")
    REFERENCES "ADR"("ADRID")
;

ALTER TABLE "EMP" ADD CONSTRAINT "FK3" 
    FOREIGN KEY ("MANAGER")
    REFERENCES "DEP"("ID")
;

ALTER TABLE "EMP" ADD CONSTRAINT "FK4" 
    FOREIGN KEY ("MEMBER")
    REFERENCES "DEP"("ID")
;


-- 
-- TABLE: "EMPSKLMTX" 
--

ALTER TABLE "EMPSKLMTX" ADD CONSTRAINT "FK5" 
    FOREIGN KEY ("EMPNMB")
    REFERENCES "EMP"("EMPNMB")
;

ALTER TABLE "EMPSKLMTX" ADD CONSTRAINT "FK7" 
    FOREIGN KEY ("ID")
    REFERENCES "SKL"("ID")
;


-- 
-- TABLE: "FULL_TIMEEMP" 
--

ALTER TABLE "FULL_TIMEEMP" ADD CONSTRAINT "FK" 
    FOREIGN KEY ("EMPNMB")
    REFERENCES "EMP"("EMPNMB")
;


-- 
-- TABLE: "SKL TRGCRS" 
--

ALTER TABLE "SKL TRGCRS" ADD CONSTRAINT "RefSKL391" 
    FOREIGN KEY ("ID")
    REFERENCES "SKL"("ID")
;

ALTER TABLE "SKL TRGCRS" ADD CONSTRAINT "RefTRGCRS401" 
    FOREIGN KEY ("CRSID")
    REFERENCES "TRGCRS"("CRSID")
;


-- 
-- TABLE: "TRGHST" 
--

ALTER TABLE "TRGHST" ADD CONSTRAINT "FK6" 
    FOREIGN KEY ("EMPNMB")
    REFERENCES "FULL_TIMEEMP"("EMPNMB")
;

ALTER TABLE "TRGHST" ADD CONSTRAINT "FK9" 
    FOREIGN KEY ("CRSID")
    REFERENCES "TRGCRS"("CRSID")
;


