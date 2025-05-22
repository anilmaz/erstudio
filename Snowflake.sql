--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Sample.DM1
--
-- Date Created : Thursday, May 22, 2025 11:39:02
-- Target DBMS : Snowflake
--

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
    FTC_Index    VARCHAR(10),
    PRIMARY KEY (EMP_NMB) NOT DEFERRABLE 
)
;



