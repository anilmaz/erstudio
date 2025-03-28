/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Model1.DM1
 *
 * Date Created : Wednesday, March 19, 2025 16:04:34
 * Target DBMS : Microsoft SQL Server 2022
 */

/* 
 * TABLE: ADR 
 */

CREATE TABLE ADR(
    ADR_ID      char(10)    NOT NULL,
    ADR_LN_1    char(10)    NULL,
    ADR_LN_2    char(10)    NULL,
    CTY         char(10)    NULL,
    PST_CDE     char(10)    NULL,
    CTY_1       char(10)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ADR_ID)
)

go


IF OBJECT_ID('ADR') IS NOT NULL
    PRINT '<<< CREATED TABLE ADR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADR >>>'
go

/* 
 * TABLE: AGY 
 */

CREATE TABLE AGY(
    ID          char(10)    NOT NULL,
    AGY_NME     char(10)    NULL,
    MAIN_CCT    char(10)    NULL,
    CONTRACT    char(10)    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (ID)
)

go


IF OBJECT_ID('AGY') IS NOT NULL
    PRINT '<<< CREATED TABLE AGY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AGY >>>'
go

/* 
 * TABLE: CNR 
 */

CREATE TABLE CNR(
    EMP_NMB     char(10)    NOT NULL,
    DAY_RAT     char(10)    NULL,
    AGENCYID    char(10)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (EMP_NMB)
)

go


IF OBJECT_ID('CNR') IS NOT NULL
    PRINT '<<< CREATED TABLE CNR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CNR >>>'
go

/* 
 * TABLE: DEP 
 */

CREATE TABLE DEP(
    ID     char(10)    NOT NULL,
    NME    char(10)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (ID)
)

go


IF OBJECT_ID('DEP') IS NOT NULL
    PRINT '<<< CREATED TABLE DEP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DEP >>>'
go

/* 
 * TABLE: EMP 
 */

CREATE TABLE EMP(
    EMP_NMB      char(10)          NOT NULL,
    EMP_TYP      char(1)           NOT NULL,
    STT_DTE      date              NULL,
    PHONE_NMB    numeric(15, 0)    NULL,
    FRS_NME      char(10)          NOT NULL,
    SURNAME      char(10)          NOT NULL,
    MEMBER       char(10)          NOT NULL,
    MANAGER      char(10)          NULL,
    ADR_ID       char(10)          NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (EMP_NMB)
)

go


IF OBJECT_ID('EMP') IS NOT NULL
    PRINT '<<< CREATED TABLE EMP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EMP >>>'
go

/* 
 * TABLE: EMP_SKL_MTX 
 */

CREATE TABLE EMP_SKL_MTX(
    ID         char(10)    NOT NULL,
    EMP_NMB    char(10)    NOT NULL,
    LVL        char(10)    NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (ID, EMP_NMB)
)

go


IF OBJECT_ID('EMP_SKL_MTX') IS NOT NULL
    PRINT '<<< CREATED TABLE EMP_SKL_MTX >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EMP_SKL_MTX >>>'
go

/* 
 * TABLE: FULL_TIME_EMP 
 */

CREATE TABLE FULL_TIME_EMP(
    EMP_NMB     char(10)    NOT NULL,
    SALARY      char(10)    NULL,
    VCT_DAYS    char(10)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (EMP_NMB)
)

go


IF OBJECT_ID('FULL_TIME_EMP') IS NOT NULL
    PRINT '<<< CREATED TABLE FULL_TIME_EMP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FULL_TIME_EMP >>>'
go

/* 
 * TABLE: SKL 
 */

CREATE TABLE SKL(
    ID     char(10)    NOT NULL,
    NME    char(10)    NOT NULL,
    DSP    char(10)    NULL,
    CTY    char(10)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (ID)
)

go


IF OBJECT_ID('SKL') IS NOT NULL
    PRINT '<<< CREATED TABLE SKL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SKL >>>'
go

/* 
 * TABLE: [SKL TRG_CRS] 
 */

CREATE TABLE [SKL TRG_CRS](
    ID        char(10)    NOT NULL,
    CRS_ID    char(10)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (ID, CRS_ID)
)

go


IF OBJECT_ID('SKL TRG_CRS') IS NOT NULL
    PRINT '<<< CREATED TABLE SKL TRG_CRS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SKL TRG_CRS >>>'
go

/* 
 * TABLE: TRG_CRS 
 */

CREATE TABLE TRG_CRS(
    CRS_ID      char(10)    NOT NULL,
    TITLE       char(10)    NULL,
    SYNOPSIS    char(10)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (CRS_ID)
)

go


IF OBJECT_ID('TRG_CRS') IS NOT NULL
    PRINT '<<< CREATED TABLE TRG_CRS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TRG_CRS >>>'
go

/* 
 * TABLE: TRG_HST 
 */

CREATE TABLE TRG_HST(
    EMP_NMB           char(10)    NOT NULL,
    CRS_ID            char(10)    NOT NULL,
    COMPLETION_DTE    char(10)    NULL,
    RESULT            char(10)    NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (EMP_NMB, CRS_ID)
)

go


IF OBJECT_ID('TRG_HST') IS NOT NULL
    PRINT '<<< CREATED TABLE TRG_HST >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TRG_HST >>>'
go


exec sp_addextendedproperty  
@name = N'My Property'
,@value = N'Here is a custom property'
,@level0type = N'Schema', @level0name = 'dbo'
,@level1type = N'Table', @level1name = 'EMP'
go
