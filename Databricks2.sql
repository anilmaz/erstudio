/*
 * ER/Studio Data Architect SQL Code Generation
 * Company :      IDERA
 * Project :      Sales Order Processing
 * Author :       Product Management
 *
 * Date Created : Thursday, November 21, 2024 16:28:46
 * Target DBMS : Databricks
 */

/* 
 * TABLE: Addr_Role 
 */

CREATE TABLE Addr_Role
(
    Addr_Role_ID    int            NOT NULL,
    Nme             string         NOT NULL,
    Dscrptn         string,
    Crtd_By         string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp        timestamp      NOT NULL,
    CONSTRAINT AddressRolePK PRIMARY KEY (Addr_Role_ID) 
)
;

/* 
 * TABLE: Addr_Typ 
 */

CREATE TABLE Addr_Typ
(
    Addr_Typ_ID    int            NOT NULL,
    Nme            string         NOT NULL,
    Dscrptn        string,
    Is_Dflt        boolean        NOT NULL,
    Crtd_By        string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp       timestamp      NOT NULL,
    CONSTRAINT AddressTypePK PRIMARY KEY (Addr_Typ_ID) 
)
;

/* 
 * TABLE: Authrzd_Prdct_Discnt 
 */

CREATE TABLE Authrzd_Prdct_Discnt
(
    Auth_Prdct_Discnt_ID    int            NOT NULL,
    Lbl                     string         NOT NULL,
    Strt_Dte                date,
    End_Dte                 date,
    Crtd_By                 string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp                timestamp      NOT NULL,
    CONSTRAINT AuthProductDiscountPK PRIMARY KEY (Auth_Prdct_Discnt_ID) 
)
USING DELTA
PARTITIONED BY (Auth_Prdct_Discnt_ID)
CLUSTER BY (Lbl)
;

/* 
 * TABLE: Cmmssn_Credt 
 */

CREATE TABLE Cmmssn_Credt
(
    Cmmssn_Credt_ID    int            NOT NULL,
    Cmmssn_Shr         tinyint        NOT NULL,
    Crtd_By            string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT CommissionPK PRIMARY KEY (Cmmssn_Credt_ID) 
)
;

/* 
 * TABLE: Custmr 
 */

CREATE TABLE Custmr
(
    Custmr_ID           int            NOT NULL,
    Frst_Nme            string         NOT NULL,
    Lst_Nme             string         NOT NULL,
    Cmpny_Nme           string         NOT NULL,
    Eml_Addr            string,
    Onyx_ID             string,
    Is_Exstng_Custmr    boolean        NOT NULL,
    Crtd_By             string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp            timestamp      NOT NULL,
    CONSTRAINT CustomerPK PRIMARY KEY (Custmr_ID) 
)
;

/* 
 * TABLE: Prdct 
 */

CREATE TABLE Prdct
(
    Prdct_ID    int            NOT NULL,
    Nme         string         NOT NULL,
    Dscrptn     string         NOT NULL,
    Crtd_By     string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp    timestamp      NOT NULL,
    CONSTRAINT ProductPK PRIMARY KEY (Prdct_ID) 
)
;

/* 
 * TABLE: Prt 
 */

CREATE TABLE Prt
(
    Prt_ID      int            NOT NULL,
    Nme         string         NOT NULL,
    Dscrptn     string,
    RwTmStmp    timestamp      NOT NULL,
    CONSTRAINT PK152 PRIMARY KEY (Prt_ID) 
)
;

/* 
 * TABLE: Pymnt_Dtl_Typ 
 */

CREATE TABLE Pymnt_Dtl_Typ
(
    Pymnt_Dtl_Typ_ID    int            NOT NULL,
    Pymnt_Mthd_ID       int            NOT NULL,
    Seqnce_Nbr          int            NOT NULL,
    Nme                 string         NOT NULL,
    Dscrptn             string,
    Mn_Lngth            int            NOT NULL,
    Mx_Lngth            int            NOT NULL,
    Is_Mndtry           boolean        NOT NULL,
    Crtd_By             string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp            timestamp      NOT NULL,
    CONSTRAINT PaymentDetailTypePK PRIMARY KEY (Pymnt_Dtl_Typ_ID) 
)
;

/* 
 * TABLE: Pymnt_Mthd 
 */

CREATE TABLE Pymnt_Mthd
(
    Pymnt_Mthd_ID    int            NOT NULL,
    Nme              string         NOT NULL,
    Dscrptn          string,
    Is_Dflt          boolean        NOT NULL,
    Crtd_By          string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT PaymentTypePK PRIMARY KEY (Pymnt_Mthd_ID) 
)
;

/* 
 * TABLE: Pymnt_Dtl_Typ 
 */

ALTER TABLE Pymnt_Dtl_Typ ADD CONSTRAINT RefPymnt_Mthd71 
    FOREIGN KEY (Pymnt_Mthd_ID)
    REFERENCES Pymnt_Mthd
;


