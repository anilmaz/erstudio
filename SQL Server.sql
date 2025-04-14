/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      SQLDemo.DM1
 *
 * Date Created : Monday, April 14, 2025 10:28:38
 * Target DBMS : Microsoft SQL Server 2022
 */

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
    FavColor     char(70)          NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (EMP_NMB)
)

go


IF OBJECT_ID('EMP') IS NOT NULL
    PRINT '<<< CREATED TABLE EMP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EMP >>>'
go


exec sp_addextendedproperty  
@name = N'My Property'
,@value = N'Here is a custom property'
,@level0type = N'Schema', @level0name = 'dbo'
,@level1type = N'Table', @level1name = 'EMP'
go
