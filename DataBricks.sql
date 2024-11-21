/*
 * ER/Studio Data Architect SQL Code Generation
 * Company :      IDERA
 * Project :      Sales Order Processing
 * Author :       Product Management
 *
 * Date Created : Thursday, November 21, 2024 14:23:14
 * Target DBMS : Databricks
 */

/* 
 * TABLE: Addr_Cmpnnt 
 */

CREATE TABLE Addr_Cmpnnt
(
    Addr_Cmpnnt_ID    int            NOT NULL,
    Nme               string         NOT NULL,
    Dscrptn           string         NOT NULL,
    Mx_Lngth          int            NOT NULL,
    List_Ordr         int,
    Is_Systm_Rqurd    boolean        NOT NULL,
    Crtd_By           string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp          timestamp      NOT NULL,
    CONSTRAINT AddressComponentPK PRIMARY KEY (Addr_Cmpnnt_ID) 
)
;

/* 
 * TABLE: Addr_Dtl 
 */

CREATE TABLE Addr_Dtl
(
    Addr_Dtl_ID           int            NOT NULL,
    Addr_Typ_Cmpnnt_ID    int            NOT NULL,
    Custmr_Addr_ID        int            NOT NULL,
    Lbl                   string,
    Addr                  string         NOT NULL,
    Addr2                 string         NOT NULL,
    Cty                   string         NOT NULL,
    State                 string         NOT NULL,
    Zp_Cde                string         NOT NULL,
    Zp_Cde_Extnsn         string         NOT NULL,
    Crtd_By               string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp              timestamp      NOT NULL,
    CONSTRAINT AddressDetailPK PRIMARY KEY (Addr_Dtl_ID) 
)
;

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
 * TABLE: Addr_Typ_Cmpnnt 
 */

CREATE TABLE Addr_Typ_Cmpnnt
(
    Addr_Typ_Cmpnnt_ID    int            NOT NULL,
    Addr_Cmpnnt_ID        int            NOT NULL,
    Addr_Typ_ID           int            NOT NULL,
    Seqnce_Nbr            int            NOT NULL,
    Lbl                   string         NOT NULL,
    Mn_Rws                int            NOT NULL,
    Mx_Rws                int,
    Enfrc_Mx_Rws          boolean        NOT NULL,
    Is_Mndtry             boolean        NOT NULL,
    Is_Systm_Rqurd        boolean        NOT NULL,
    Crtd_By               string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp              timestamp      NOT NULL,
    CONSTRAINT AddressTypeCompPK PRIMARY KEY (Addr_Typ_Cmpnnt_ID) 
)
;

/* 
 * TABLE: App_Usr 
 */

CREATE TABLE App_Usr
(
    App_Usr_ID    int            NOT NULL,
    Nme           string         NOT NULL,
    Lgn           string         NOT NULL,
    Crtd_By       string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp      timestamp      NOT NULL,
    CONSTRAINT AppUserPK PRIMARY KEY (App_Usr_ID) 
)
;

/* 
 * TABLE: Authrzd_Prdct_Discnt 
 */

CREATE TABLE Authrzd_Prdct_Discnt
(
    Auth_Prdct_Discnt_ID    int            NOT NULL,
    Prdct_Discnt_ID         int            NOT NULL,
    App_Usr_ID              int            NOT NULL,
    Lbl                     string         NOT NULL,
    Strt_Dte                date,
    End_Dte                 date,
    Crtd_By                 string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp                timestamp      NOT NULL,
    CONSTRAINT AuthProductDiscountPK PRIMARY KEY (Auth_Prdct_Discnt_ID) 
)
;

/* 
 * TABLE: Bill_Mtrls 
 */

CREATE TABLE Bill_Mtrls
(
    Bill_Mtrls_ID     int            NOT NULL,
    Prt_ID            int            NOT NULL,
    Prdct_Cnfig_ID    int            NOT NULL,
    Qntty             int            NOT NULL,
    Lbl               string         NOT NULL,
    RwTmStmp          timestamp      NOT NULL,
    CONSTRAINT PK153 PRIMARY KEY (Bill_Mtrls_ID) 
)
;

/* 
 * TABLE: Cmmssn_Credt 
 */

CREATE TABLE Cmmssn_Credt
(
    Cmmssn_Credt_ID    int            NOT NULL,
    Sls_Ordr_ID        int            NOT NULL,
    Slsprsn_ID         int            NOT NULL,
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
 * TABLE: Custmr_Addr 
 */

CREATE TABLE Custmr_Addr
(
    Custmr_Addr_ID    int            NOT NULL,
    Addr_Typ_ID       int            NOT NULL,
    Custmr_ID         int            NOT NULL,
    Lbl               string,
    Is_Dflt           boolean        NOT NULL,
    Crtd_By           string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp          timestamp      NOT NULL,
    CONSTRAINT CustomerAddressPK PRIMARY KEY (Custmr_Addr_ID) 
)
;

/* 
 * TABLE: Custmr_Phn 
 */

CREATE TABLE Custmr_Phn
(
    Custmr_Phn_ID    int            NOT NULL,
    Custmr_ID        int            NOT NULL,
    Phn_Role_ID      int            NOT NULL,
    Area_Cde         string         NOT NULL,
    Phn              string         NOT NULL,
    Extnsn           string,
    Is_Dflt          boolean        NOT NULL,
    Crtd_By          string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT CustomerPhonePK PRIMARY KEY (Custmr_Phn_ID) 
)
;

/* 
 * TABLE: DB_Pltfrm 
 */

CREATE TABLE DB_Pltfrm
(
    DB_Pltfrm_ID    int            NOT NULL,
    Nme             string         NOT NULL,
    Dscrptn         string         NOT NULL,
    Crtd_By         string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp        timestamp      NOT NULL,
    CONSTRAINT DBPlatformPK PRIMARY KEY (DB_Pltfrm_ID) 
)
;

/* 
 * TABLE: Discnt_Lvl 
 */

CREATE TABLE Discnt_Lvl
(
    Discnt_Lvl_ID    int            NOT NULL,
    Seqnce_Nbr       int            NOT NULL,
    Discnt_Pct       tinyint        NOT NULL,
    Strt_Dte         date,
    End_Dte          date,
    Crtd_By          string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT DiscountLevelPK PRIMARY KEY (Discnt_Lvl_ID) 
)
;

/* 
 * TABLE: Phn_Role 
 */

CREATE TABLE Phn_Role
(
    Phn_Role_ID    int            NOT NULL,
    Nme            string         NOT NULL,
    Dscrptn        string,
    Is_Dflt        boolean        NOT NULL,
    Crtd_By        string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp       timestamp      NOT NULL,
    CONSTRAINT PhoneRolePK PRIMARY KEY (Phn_Role_ID) 
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
 * TABLE: Prdct_Cnfig 
 */

CREATE TABLE Prdct_Cnfig
(
    Prdct_Cnfig_ID          int                 NOT NULL,
    Prdct_Typ_ID            int                 NOT NULL,
    Usr_Cnt_ID              int                 NOT NULL,
    Prdct_Vrsn_Pltfrm_ID    int                 NOT NULL,
    Grt_Plns_ID             string              NOT NULL,
    Dscrptn                 string              NOT NULL,
    List_Prc                decimal(19, 2)      NOT NULL,
    Crtd_By                 string             DEFAULT GETUSER() NOT NULL,
    RwTmStmp                timestamp           NOT NULL,
    CONSTRAINT ProductConfigurationPK PRIMARY KEY (Prdct_Cnfig_ID) 
)
;

/* 
 * TABLE: Prdct_Discnt 
 */

CREATE TABLE Prdct_Discnt
(
    Prdct_Discnt_ID    int            NOT NULL,
    Discnt_Lvl_ID      int            NOT NULL,
    Prdct_Cnfig_ID     int            NOT NULL,
    Lbl                string         NOT NULL,
    Strt_Dte           date,
    End_Dte            date,
    Crtd_By            string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT ProductDiscountPK PRIMARY KEY (Prdct_Discnt_ID) 
)
;

/* 
 * TABLE: Prdct_Typ 
 */

CREATE TABLE Prdct_Typ
(
    Prdct_Typ_ID    int            NOT NULL,
    Nme             string         NOT NULL,
    Dscrptn         string,
    Is_Dflt         boolean        NOT NULL,
    Is_Nw_Licns     boolean        NOT NULL,
    Crtd_By         string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp        timestamp      NOT NULL,
    CONSTRAINT ProductTypePK PRIMARY KEY (Prdct_Typ_ID) 
)
;

/* 
 * TABLE: Prdct_Vrsn 
 */

CREATE TABLE Prdct_Vrsn
(
    Prdct_Vrsn_ID    int            NOT NULL,
    Prdct_ID         int            NOT NULL,
    Vrsn_Nbr         string         NOT NULL,
    Lbl              string,
    Is_Dflt          boolean        NOT NULL,
    Is_Supprtd       boolean        NOT NULL,
    Crtd_By          string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT ProductVersionPK PRIMARY KEY (Prdct_Vrsn_ID) 
)
;

/* 
 * TABLE: Prdct_Vrsn_Pltfrm 
 */

CREATE TABLE Prdct_Vrsn_Pltfrm
(
    Prdct_Vrsn_Pltfrm_ID    int            NOT NULL,
    DB_Pltfrm_ID            int            NOT NULL,
    Prdct_Vrsn_ID           int            NOT NULL,
    Lbl                     string         NOT NULL,
    RwTmStmp                timestamp      NOT NULL,
    CONSTRAINT PK147 PRIMARY KEY (Prdct_Vrsn_Pltfrm_ID) 
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
 * TABLE: Pymnt_Dtl 
 */

CREATE TABLE Pymnt_Dtl
(
    Pymnt_Dtl_ID         int            NOT NULL,
    Pymnt_Dtl_Typ_ID     int            NOT NULL,
    Sls_Ordr_Pymnt_ID    int            NOT NULL,
    Lbl                  string,
    Pymnt_Dtl            string         NOT NULL,
    Crtd_By              string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp             timestamp      NOT NULL,
    CONSTRAINT PaymentDetailPK PRIMARY KEY (Pymnt_Dtl_ID) 
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
 * TABLE: Shppng_Crt 
 */

CREATE TABLE Shppng_Crt
(
    Shppng_Crt_ID    int            NOT NULL,
    Is_Prcssd        boolean        NOT NULL,
    Crte_Dte         timestamp      NOT NULL,
    Crtd_By          string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT PK146 PRIMARY KEY (Shppng_Crt_ID) 
)
;

/* 
 * TABLE: Shppng_Crt_Dtl 
 */

CREATE TABLE Shppng_Crt_Dtl
(
    Shppng_Crt_Dtl_ID    int                 NOT NULL,
    Shppng_Crt_ID        int                 NOT NULL,
    Prdct_Cnfig_ID       int                 NOT NULL,
    Qntty                int                 NOT NULL,
    List_Prc             decimal(19, 2)      NOT NULL,
    Unt_Prc              decimal(19, 2)      NOT NULL,
    RwTmStmp             timestamp           NOT NULL,
    CONSTRAINT ShoppingCartPK PRIMARY KEY (Shppng_Crt_Dtl_ID) 
)
;

/* 
 * TABLE: Shppng_Instructn 
 */

CREATE TABLE Shppng_Instructn
(
    Shppng_Instructn_ID    int            NOT NULL,
    Sls_Ordr_ID            int            NOT NULL,
    Shppng_Mthd_ID         int            NOT NULL,
    Car_Nme                string,
    Car_Accnt_Nbr          string,
    Dlvry_Mthd             string,
    Dlvry_Instructns       string,
    Crtd_By                string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp               timestamp      NOT NULL,
    CONSTRAINT ShippingInstructionPK PRIMARY KEY (Shppng_Instructn_ID) 
)
;

/* 
 * TABLE: Shppng_Mthd 
 */

CREATE TABLE Shppng_Mthd
(
    Shppng_Mthd_ID     int                 NOT NULL,
    Nme                string              NOT NULL,
    Dscrptn            string,
    Shppng_Chrg        decimal(19, 2)      NOT NULL,
    Is_Dflt            boolean             NOT NULL,
    Is_Custmr_Spcfd    boolean             NOT NULL,
    Crtd_By            string             DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp           NOT NULL,
    CONSTRAINT ShippingMethodPK PRIMARY KEY (Shppng_Mthd_ID) 
)
;

/* 
 * TABLE: Sls_Ordr 
 */

CREATE TABLE Sls_Ordr
(
    Sls_Ordr_ID        int                 NOT NULL,
    Shppng_Crt_ID      int                 NOT NULL,
    Sls_Tax_Rate_ID    int,
    Sls_Ordr_Typ_ID    int                 NOT NULL,
    Custmr_ID          int                 NOT NULL,
    Sl_Dt              date,
    Is_Txbl            boolean             NOT NULL,
    Sls_Tax            decimal(19, 2)      NOT NULL,
    Crtd_By            string             DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp           NOT NULL,
    CONSTRAINT SalesOrderPK PRIMARY KEY (Sls_Ordr_ID) 
)
;

/* 
 * TABLE: Sls_Ordr_Addr 
 */

CREATE TABLE Sls_Ordr_Addr
(
    Sls_Ordr_Addr_ID    int            NOT NULL,
    Addr_Role_ID        int            NOT NULL,
    Sls_Ordr_ID         int            NOT NULL,
    Custmr_Addr_ID      int            NOT NULL,
    Lbl                 string,
    Crtd_By             string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp            timestamp      NOT NULL,
    CONSTRAINT SalesOrderAddressPK PRIMARY KEY (Sls_Ordr_Addr_ID) 
)
;

/* 
 * TABLE: Sls_Ordr_Line 
 */

CREATE TABLE Sls_Ordr_Line
(
    Sls_Ordr_Line_ID     int                 NOT NULL,
    Shppng_Crt_Dtl_ID    int                 NOT NULL,
    Prdct_Cnfig_ID       int                 NOT NULL,
    Sls_Ordr_ID          int                 NOT NULL,
    Qntty                int                 NOT NULL,
    List_Prc             decimal(19, 2)      NOT NULL,
    Unt_Prc              decimal(19, 2)      NOT NULL,
    Extndd_Prc           decimal(19, 2)      NOT NULL,
    Crtd_By              string             DEFAULT GETUSER() NOT NULL,
    RwTmStmp             timestamp           NOT NULL,
    CONSTRAINT SalesOrderLinePK PRIMARY KEY (Sls_Ordr_Line_ID) 
)
;

/* 
 * TABLE: Sls_Ordr_Pymnt 
 */

CREATE TABLE Sls_Ordr_Pymnt
(
    Sls_Ordr_Pymnt_ID    int                 NOT NULL,
    Pymnt_Mthd_ID        int                 NOT NULL,
    Sls_Ordr_ID          int                 NOT NULL,
    Amnt                 decimal(19, 2)      NOT NULL,
    Crtd_By              string             DEFAULT GETUSER() NOT NULL,
    RwTmStmp             timestamp           NOT NULL,
    CONSTRAINT SalesOrderPaymentPK PRIMARY KEY (Sls_Ordr_Pymnt_ID) 
)
;

/* 
 * TABLE: Sls_Ordr_Typ 
 */

CREATE TABLE Sls_Ordr_Typ
(
    Sls_Ordr_Typ_ID    int            NOT NULL,
    Nme                string         NOT NULL,
    Dscrptn            string,
    Crtd_By            string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT SalesOrderTypePK PRIMARY KEY (Sls_Ordr_Typ_ID) 
)
;

/* 
 * TABLE: Sls_Tax_Rate 
 */

CREATE TABLE Sls_Tax_Rate
(
    Sls_Tax_Rate_ID    int            NOT NULL,
    Zp_Cde_ID          int            NOT NULL,
    Grss_Tx_Rt         tinyint        NOT NULL,
    Crtd_By            string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT SalesTaxRatePK PRIMARY KEY (Sls_Tax_Rate_ID) 
)
;

/* 
 * TABLE: Slsprsn 
 */

CREATE TABLE Slsprsn
(
    Slsprsn_ID    int            NOT NULL,
    Nme           string         NOT NULL,
    Dscrptn       string,
    Crtd_By       string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp      timestamp      NOT NULL,
    CONSTRAINT SalespersonPK PRIMARY KEY (Slsprsn_ID) 
)
;

/* 
 * TABLE: Txbl_Prdct 
 */

CREATE TABLE Txbl_Prdct
(
    Txbl_Prdct_ID     int            NOT NULL,
    Prdct_Cnfig_ID    int            NOT NULL,
    Txbl_State_ID     int            NOT NULL,
    Lbl               string,
    Txbl_Shr          tinyint        NOT NULL,
    Crtd_By           string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp          timestamp      NOT NULL,
    CONSTRAINT TaxableProductID PRIMARY KEY (Txbl_Prdct_ID) 
)
;

/* 
 * TABLE: Txbl_State 
 */

CREATE TABLE Txbl_State
(
    Txbl_State_ID    int            NOT NULL,
    Nme              string         NOT NULL,
    State_Cd         string         NOT NULL,
    Crtd_By          string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT TaxableStatePK PRIMARY KEY (Txbl_State_ID) 
)
;

/* 
 * TABLE: Usr_Cnt 
 */

CREATE TABLE Usr_Cnt
(
    Usr_Cnt_ID    int            NOT NULL,
    Nme           string         NOT NULL,
    Qntty         int,
    Is_Unlmtd     boolean        NOT NULL,
    RwTmStmp      timestamp      NOT NULL,
    CONSTRAINT PK151 PRIMARY KEY (Usr_Cnt_ID) 
)
;

/* 
 * TABLE: Zp_Cde 
 */

CREATE TABLE Zp_Cde
(
    Zp_Cde_ID        int            NOT NULL,
    Txbl_State_ID    int            NOT NULL,
    Zp_Cde           string         NOT NULL,
    Crtd_By          string        DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT ZipCodePK PRIMARY KEY (Zp_Cde_ID) 
)
;

/* 
 * TABLE: Addr_Dtl 
 */

ALTER TABLE Addr_Dtl ADD CONSTRAINT RefCustmr_Addr31 
    FOREIGN KEY (Custmr_Addr_ID)
    REFERENCES Custmr_Addr
;

ALTER TABLE Addr_Dtl ADD CONSTRAINT RefAddr_Typ_Cmpnnt36 
    FOREIGN KEY (Addr_Typ_Cmpnnt_ID)
    REFERENCES Addr_Typ_Cmpnnt
;


/* 
 * TABLE: Addr_Typ_Cmpnnt 
 */

ALTER TABLE Addr_Typ_Cmpnnt ADD CONSTRAINT RefAddr_Typ4 
    FOREIGN KEY (Addr_Typ_ID)
    REFERENCES Addr_Typ
;

ALTER TABLE Addr_Typ_Cmpnnt ADD CONSTRAINT RefAddr_Cmpnnt21 
    FOREIGN KEY (Addr_Cmpnnt_ID)
    REFERENCES Addr_Cmpnnt
;


/* 
 * TABLE: Authrzd_Prdct_Discnt 
 */

ALTER TABLE Authrzd_Prdct_Discnt ADD CONSTRAINT RefApp_Usr13 
    FOREIGN KEY (App_Usr_ID)
    REFERENCES App_Usr
;

ALTER TABLE Authrzd_Prdct_Discnt ADD CONSTRAINT RefPrdct_Discnt29 
    FOREIGN KEY (Prdct_Discnt_ID)
    REFERENCES Prdct_Discnt
;


/* 
 * TABLE: Bill_Mtrls 
 */

ALTER TABLE Bill_Mtrls ADD CONSTRAINT RefPrt1 
    FOREIGN KEY (Prt_ID)
    REFERENCES Prt
;

ALTER TABLE Bill_Mtrls ADD CONSTRAINT RefPrdct_Cnfig30 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig
;


/* 
 * TABLE: Cmmssn_Credt 
 */

ALTER TABLE Cmmssn_Credt ADD CONSTRAINT RefSlsprsn10 
    FOREIGN KEY (Slsprsn_ID)
    REFERENCES Slsprsn
;

ALTER TABLE Cmmssn_Credt ADD CONSTRAINT RefSls_Ordr39 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr
;


/* 
 * TABLE: Custmr_Addr 
 */

ALTER TABLE Custmr_Addr ADD CONSTRAINT RefCustmr12 
    FOREIGN KEY (Custmr_ID)
    REFERENCES Custmr
;

ALTER TABLE Custmr_Addr ADD CONSTRAINT RefAddr_Typ14 
    FOREIGN KEY (Addr_Typ_ID)
    REFERENCES Addr_Typ
;


/* 
 * TABLE: Custmr_Phn 
 */

ALTER TABLE Custmr_Phn ADD CONSTRAINT RefPhn_Role16 
    FOREIGN KEY (Phn_Role_ID)
    REFERENCES Phn_Role
;

ALTER TABLE Custmr_Phn ADD CONSTRAINT RefCustmr41 
    FOREIGN KEY (Custmr_ID)
    REFERENCES Custmr
;


/* 
 * TABLE: Prdct_Cnfig 
 */

ALTER TABLE Prdct_Cnfig ADD CONSTRAINT RefPrdct_Typ5 
    FOREIGN KEY (Prdct_Typ_ID)
    REFERENCES Prdct_Typ
;

ALTER TABLE Prdct_Cnfig ADD CONSTRAINT RefPrdct_Vrsn_Pltfrm11 
    FOREIGN KEY (Prdct_Vrsn_Pltfrm_ID)
    REFERENCES Prdct_Vrsn_Pltfrm
;

ALTER TABLE Prdct_Cnfig ADD CONSTRAINT RefUsr_Cnt19 
    FOREIGN KEY (Usr_Cnt_ID)
    REFERENCES Usr_Cnt
;


/* 
 * TABLE: Prdct_Discnt 
 */

ALTER TABLE Prdct_Discnt ADD CONSTRAINT RefDiscnt_Lvl9 
    FOREIGN KEY (Discnt_Lvl_ID)
    REFERENCES Discnt_Lvl
;

ALTER TABLE Prdct_Discnt ADD CONSTRAINT RefPrdct_Cnfig38 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig
;


/* 
 * TABLE: Prdct_Vrsn 
 */

ALTER TABLE Prdct_Vrsn ADD CONSTRAINT RefPrdct32 
    FOREIGN KEY (Prdct_ID)
    REFERENCES Prdct
;


/* 
 * TABLE: Prdct_Vrsn_Pltfrm 
 */

ALTER TABLE Prdct_Vrsn_Pltfrm ADD CONSTRAINT RefPrdct_Vrsn24 
    FOREIGN KEY (Prdct_Vrsn_ID)
    REFERENCES Prdct_Vrsn
;

ALTER TABLE Prdct_Vrsn_Pltfrm ADD CONSTRAINT RefDB_Pltfrm40 
    FOREIGN KEY (DB_Pltfrm_ID)
    REFERENCES DB_Pltfrm
;


/* 
 * TABLE: Pymnt_Dtl 
 */

ALTER TABLE Pymnt_Dtl ADD CONSTRAINT RefSls_Ordr_Pymnt28 
    FOREIGN KEY (Sls_Ordr_Pymnt_ID)
    REFERENCES Sls_Ordr_Pymnt
;

ALTER TABLE Pymnt_Dtl ADD CONSTRAINT RefPymnt_Dtl_Typ45 
    FOREIGN KEY (Pymnt_Dtl_Typ_ID)
    REFERENCES Pymnt_Dtl_Typ
;


/* 
 * TABLE: Pymnt_Dtl_Typ 
 */

ALTER TABLE Pymnt_Dtl_Typ ADD CONSTRAINT RefPymnt_Mthd7 
    FOREIGN KEY (Pymnt_Mthd_ID)
    REFERENCES Pymnt_Mthd
;


/* 
 * TABLE: Shppng_Crt_Dtl 
 */

ALTER TABLE Shppng_Crt_Dtl ADD CONSTRAINT RefShppng_Crt8 
    FOREIGN KEY (Shppng_Crt_ID)
    REFERENCES Shppng_Crt
;

ALTER TABLE Shppng_Crt_Dtl ADD CONSTRAINT RefPrdct_Cnfig26 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig
;


/* 
 * TABLE: Shppng_Instructn 
 */

ALTER TABLE Shppng_Instructn ADD CONSTRAINT RefSls_Ordr17 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr
;

ALTER TABLE Shppng_Instructn ADD CONSTRAINT RefShppng_Mthd44 
    FOREIGN KEY (Shppng_Mthd_ID)
    REFERENCES Shppng_Mthd
;


/* 
 * TABLE: Sls_Ordr 
 */

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefSls_Tax_Rate15 
    FOREIGN KEY (Sls_Tax_Rate_ID)
    REFERENCES Sls_Tax_Rate
;

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefSls_Ordr_Typ20 
    FOREIGN KEY (Sls_Ordr_Typ_ID)
    REFERENCES Sls_Ordr_Typ
;

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefCustmr35 
    FOREIGN KEY (Custmr_ID)
    REFERENCES Custmr
;

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefShppng_Crt37 
    FOREIGN KEY (Shppng_Crt_ID)
    REFERENCES Shppng_Crt
;


/* 
 * TABLE: Sls_Ordr_Addr 
 */

ALTER TABLE Sls_Ordr_Addr ADD CONSTRAINT RefAddr_Role18 
    FOREIGN KEY (Addr_Role_ID)
    REFERENCES Addr_Role
;

ALTER TABLE Sls_Ordr_Addr ADD CONSTRAINT RefSls_Ordr25 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr
;

ALTER TABLE Sls_Ordr_Addr ADD CONSTRAINT RefCustmr_Addr27 
    FOREIGN KEY (Custmr_Addr_ID)
    REFERENCES Custmr_Addr
;


/* 
 * TABLE: Sls_Ordr_Line 
 */

ALTER TABLE Sls_Ordr_Line ADD CONSTRAINT RefSls_Ordr22 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr
;

ALTER TABLE Sls_Ordr_Line ADD CONSTRAINT RefPrdct_Cnfig23 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig
;

ALTER TABLE Sls_Ordr_Line ADD CONSTRAINT RefShppng_Crt_Dtl43 
    FOREIGN KEY (Shppng_Crt_Dtl_ID)
    REFERENCES Shppng_Crt_Dtl
;


/* 
 * TABLE: Sls_Ordr_Pymnt 
 */

ALTER TABLE Sls_Ordr_Pymnt ADD CONSTRAINT RefPymnt_Mthd3 
    FOREIGN KEY (Pymnt_Mthd_ID)
    REFERENCES Pymnt_Mthd
;

ALTER TABLE Sls_Ordr_Pymnt ADD CONSTRAINT RefSls_Ordr34 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr
;


/* 
 * TABLE: Sls_Tax_Rate 
 */

ALTER TABLE Sls_Tax_Rate ADD CONSTRAINT RefZp_Cde42 
    FOREIGN KEY (Zp_Cde_ID)
    REFERENCES Zp_Cde
;


/* 
 * TABLE: Txbl_Prdct 
 */

ALTER TABLE Txbl_Prdct ADD CONSTRAINT RefPrdct_Cnfig2 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig
;

ALTER TABLE Txbl_Prdct ADD CONSTRAINT RefTxbl_State6 
    FOREIGN KEY (Txbl_State_ID)
    REFERENCES Txbl_State
;


/* 
 * TABLE: Zp_Cde 
 */

ALTER TABLE Zp_Cde ADD CONSTRAINT RefTxbl_State33 
    FOREIGN KEY (Txbl_State_ID)
    REFERENCES Txbl_State
;


