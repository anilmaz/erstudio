/*
 * ER/Studio Data Architect SQL Code Generation
 * Company :      IDERA
 * Project :      Sales Order Processing
 * Author :       Product Management
 *
 * Date Created : Thursday, November 21, 2024 14:22:37
 * Target DBMS : Microsoft Azure SQL DB
 */

CREATE TYPE Boolean FROM bit NOT NULL
go

/* 
 * TABLE: Addr_Cmpnnt 
 */

CREATE TABLE Addr_Cmpnnt(
    Addr_Cmpnnt_ID    int             IDENTITY(1,1),
    Nme               varchar(30)     NOT NULL,
    Dscrptn           varchar(255)    NOT NULL,
    Mx_Lngth          int             NOT NULL,
    List_Ordr         int             NULL,
    Is_Systm_Rqurd    Boolean         NOT NULL,
    Crtd_By           varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp          timestamp       NOT NULL,
    CONSTRAINT AddressComponentPK PRIMARY KEY NONCLUSTERED (Addr_Cmpnnt_ID)
)

go


IF OBJECT_ID('Addr_Cmpnnt') IS NOT NULL
    PRINT '<<< CREATED TABLE Addr_Cmpnnt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Addr_Cmpnnt >>>'
go

/* 
 * TABLE: Addr_Dtl 
 */

CREATE TABLE Addr_Dtl(
    Addr_Dtl_ID           int            IDENTITY(1,1),
    Addr_Typ_Cmpnnt_ID    int            NOT NULL,
    Custmr_Addr_ID        int            NOT NULL,
    Lbl                   varchar(30)    NULL,
    Addr                  varchar(40)    NOT NULL,
    Addr2                 varchar(40)    NOT NULL,
    Cty                   varchar(30)    NOT NULL,
    State                 char(2)        NOT NULL,
    Zp_Cde                char(5)        NOT NULL,
    Zp_Cde_Extnsn         char(4)        NOT NULL,
    Crtd_By               varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp              timestamp      NOT NULL,
    CONSTRAINT AddressDetailPK PRIMARY KEY NONCLUSTERED (Addr_Dtl_ID)
)

go


IF OBJECT_ID('Addr_Dtl') IS NOT NULL
    PRINT '<<< CREATED TABLE Addr_Dtl >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Addr_Dtl >>>'
go

/* 
 * TABLE: Addr_Role 
 */

CREATE TABLE Addr_Role(
    Addr_Role_ID    int             IDENTITY(1,1),
    Nme             varchar(30)     NOT NULL,
    Dscrptn         varchar(255)    NULL,
    Crtd_By         varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp        timestamp       NOT NULL,
    CONSTRAINT AddressRolePK PRIMARY KEY NONCLUSTERED (Addr_Role_ID)
)

go


IF OBJECT_ID('Addr_Role') IS NOT NULL
    PRINT '<<< CREATED TABLE Addr_Role >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Addr_Role >>>'
go

/* 
 * TABLE: Addr_Typ 
 */

CREATE TABLE Addr_Typ(
    Addr_Typ_ID    int             IDENTITY(1,1),
    Nme            varchar(30)     NOT NULL,
    Dscrptn        varchar(255)    NULL,
    Is_Dflt        Boolean         NOT NULL,
    Crtd_By        varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp       timestamp       NOT NULL,
    CONSTRAINT AddressTypePK PRIMARY KEY NONCLUSTERED (Addr_Typ_ID)
)

go


IF OBJECT_ID('Addr_Typ') IS NOT NULL
    PRINT '<<< CREATED TABLE Addr_Typ >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Addr_Typ >>>'
go

/* 
 * TABLE: Addr_Typ_Cmpnnt 
 */

CREATE TABLE Addr_Typ_Cmpnnt(
    Addr_Typ_Cmpnnt_ID    int            IDENTITY(1,1),
    Addr_Cmpnnt_ID        int            NOT NULL,
    Addr_Typ_ID           int            NOT NULL,
    Seqnce_Nbr            int            NOT NULL,
    Lbl                   varchar(30)    NOT NULL,
    Mn_Rws                int            NOT NULL,
    Mx_Rws                int            NULL,
    Enfrc_Mx_Rws          Boolean        NOT NULL,
    Is_Mndtry             Boolean        NOT NULL,
    Is_Systm_Rqurd        Boolean        NOT NULL,
    Crtd_By               varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp              timestamp      NOT NULL,
    CONSTRAINT AddressTypeCompPK PRIMARY KEY NONCLUSTERED (Addr_Typ_Cmpnnt_ID)
)

go


IF OBJECT_ID('Addr_Typ_Cmpnnt') IS NOT NULL
    PRINT '<<< CREATED TABLE Addr_Typ_Cmpnnt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Addr_Typ_Cmpnnt >>>'
go

/* 
 * TABLE: App_Usr 
 */

CREATE TABLE App_Usr(
    App_Usr_ID    int            IDENTITY(1,1),
    Nme           varchar(30)    NOT NULL,
    Lgn           varchar(30)    NOT NULL,
    Crtd_By       varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp      timestamp      NOT NULL,
    CONSTRAINT AppUserPK PRIMARY KEY NONCLUSTERED (App_Usr_ID)
)

go


IF OBJECT_ID('App_Usr') IS NOT NULL
    PRINT '<<< CREATED TABLE App_Usr >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE App_Usr >>>'
go

/* 
 * TABLE: Authrzd_Prdct_Discnt 
 */

CREATE TABLE Authrzd_Prdct_Discnt(
    Auth_Prdct_Discnt_ID    int            IDENTITY(1,1),
    Prdct_Discnt_ID         int            NOT NULL,
    App_Usr_ID              int            NOT NULL,
    Lbl                     varchar(30)    NOT NULL,
    Strt_Dte                date           NULL,
    End_Dte                 date           NULL,
    Crtd_By                 varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp                timestamp      NOT NULL,
    CONSTRAINT AuthProductDiscountPK PRIMARY KEY NONCLUSTERED (Auth_Prdct_Discnt_ID)
)

go


IF OBJECT_ID('Authrzd_Prdct_Discnt') IS NOT NULL
    PRINT '<<< CREATED TABLE Authrzd_Prdct_Discnt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Authrzd_Prdct_Discnt >>>'
go

/* 
 * TABLE: Bill_Mtrls 
 */

CREATE TABLE Bill_Mtrls(
    Bill_Mtrls_ID     int            IDENTITY(1,1),
    Prt_ID            int            NOT NULL,
    Prdct_Cnfig_ID    int            NOT NULL,
    Qntty             int            NOT NULL,
    Lbl               varchar(30)    NOT NULL,
    RwTmStmp          timestamp      NOT NULL,
    CONSTRAINT PK153 PRIMARY KEY NONCLUSTERED (Bill_Mtrls_ID)
)

go


IF OBJECT_ID('Bill_Mtrls') IS NOT NULL
    PRINT '<<< CREATED TABLE Bill_Mtrls >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Bill_Mtrls >>>'
go

/* 
 * TABLE: Cmmssn_Credt 
 */

CREATE TABLE Cmmssn_Credt(
    Cmmssn_Credt_ID    int            IDENTITY(1,1),
    Sls_Ordr_ID        int            NOT NULL,
    Slsprsn_ID         int            NOT NULL,
    Cmmssn_Shr         tinyint        NOT NULL,
    Crtd_By            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT CommissionPK PRIMARY KEY NONCLUSTERED (Cmmssn_Credt_ID)
)

go


IF OBJECT_ID('Cmmssn_Credt') IS NOT NULL
    PRINT '<<< CREATED TABLE Cmmssn_Credt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Cmmssn_Credt >>>'
go

/* 
 * TABLE: Custmr 
 */

CREATE TABLE Custmr(
    Custmr_ID           int            IDENTITY(1,1),
    Frst_Nme            varchar(30)    NOT NULL,
    Lst_Nme             varchar(30)    NOT NULL,
    Cmpny_Nme           varchar(30)    NOT NULL,
    Eml_Addr            varchar(30)    NULL,
    Onyx_ID             varchar(30)    NULL,
    Is_Exstng_Custmr    Boolean        NOT NULL,
    Crtd_By             varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp            timestamp      NOT NULL,
    CONSTRAINT CustomerPK PRIMARY KEY NONCLUSTERED (Custmr_ID)
)

go


IF OBJECT_ID('Custmr') IS NOT NULL
    PRINT '<<< CREATED TABLE Custmr >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Custmr >>>'
go

/* 
 * TABLE: Custmr_Addr 
 */

CREATE TABLE Custmr_Addr(
    Custmr_Addr_ID    int            IDENTITY(1,1),
    Addr_Typ_ID       int            NOT NULL,
    Custmr_ID         int            NOT NULL,
    Lbl               varchar(30)    NULL,
    Is_Dflt           Boolean        NOT NULL,
    Crtd_By           varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp          timestamp      NOT NULL,
    CONSTRAINT CustomerAddressPK PRIMARY KEY NONCLUSTERED (Custmr_Addr_ID)
)

go


IF OBJECT_ID('Custmr_Addr') IS NOT NULL
    PRINT '<<< CREATED TABLE Custmr_Addr >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Custmr_Addr >>>'
go

/* 
 * TABLE: Custmr_Phn 
 */

CREATE TABLE Custmr_Phn(
    Custmr_Phn_ID    int            IDENTITY(1,1),
    Custmr_ID        int            NOT NULL,
    Phn_Role_ID      int            NOT NULL,
    Area_Cde         char(3)        NOT NULL,
    Phn              char(7)        NOT NULL,
    Extnsn           varchar(8)     NULL,
    Is_Dflt          Boolean        NOT NULL,
    Crtd_By          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT CustomerPhonePK PRIMARY KEY NONCLUSTERED (Custmr_Phn_ID)
)

go


IF OBJECT_ID('Custmr_Phn') IS NOT NULL
    PRINT '<<< CREATED TABLE Custmr_Phn >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Custmr_Phn >>>'
go

/* 
 * TABLE: DB_Pltfrm 
 */

CREATE TABLE DB_Pltfrm(
    DB_Pltfrm_ID    int             IDENTITY(1,1),
    Nme             varchar(30)     NOT NULL,
    Dscrptn         varchar(255)    NOT NULL,
    Crtd_By         varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp        timestamp       NOT NULL,
    CONSTRAINT DBPlatformPK PRIMARY KEY NONCLUSTERED (DB_Pltfrm_ID)
)

go


IF OBJECT_ID('DB_Pltfrm') IS NOT NULL
    PRINT '<<< CREATED TABLE DB_Pltfrm >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DB_Pltfrm >>>'
go

/* 
 * TABLE: Discnt_Lvl 
 */

CREATE TABLE Discnt_Lvl(
    Discnt_Lvl_ID    int            IDENTITY(1,1),
    Seqnce_Nbr       int            NOT NULL,
    Discnt_Pct       tinyint        NOT NULL,
    Strt_Dte         date           NULL,
    End_Dte          date           NULL,
    Crtd_By          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT DiscountLevelPK PRIMARY KEY NONCLUSTERED (Discnt_Lvl_ID)
)

go


IF OBJECT_ID('Discnt_Lvl') IS NOT NULL
    PRINT '<<< CREATED TABLE Discnt_Lvl >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Discnt_Lvl >>>'
go

/* 
 * TABLE: Phn_Role 
 */

CREATE TABLE Phn_Role(
    Phn_Role_ID    int             IDENTITY(1,1),
    Nme            varchar(30)     NOT NULL,
    Dscrptn        varchar(255)    NULL,
    Is_Dflt        Boolean         NOT NULL,
    Crtd_By        varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp       timestamp       NOT NULL,
    CONSTRAINT PhoneRolePK PRIMARY KEY NONCLUSTERED (Phn_Role_ID)
)

go


IF OBJECT_ID('Phn_Role') IS NOT NULL
    PRINT '<<< CREATED TABLE Phn_Role >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Phn_Role >>>'
go

/* 
 * TABLE: Prdct 
 */

CREATE TABLE Prdct(
    Prdct_ID    int             IDENTITY(1,1),
    Nme         varchar(30)     NOT NULL,
    Dscrptn     varchar(255)    NOT NULL,
    Crtd_By     varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp    timestamp       NOT NULL,
    CONSTRAINT ProductPK PRIMARY KEY NONCLUSTERED (Prdct_ID)
)

go


IF OBJECT_ID('Prdct') IS NOT NULL
    PRINT '<<< CREATED TABLE Prdct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Prdct >>>'
go

/* 
 * TABLE: Prdct_Cnfig 
 */

CREATE TABLE Prdct_Cnfig(
    Prdct_Cnfig_ID          int             IDENTITY(1,1),
    Prdct_Typ_ID            int             NOT NULL,
    Usr_Cnt_ID              int             NOT NULL,
    Prdct_Vrsn_Pltfrm_ID    int             NOT NULL,
    Grt_Plns_ID             varchar(30)     NOT NULL,
    Dscrptn                 varchar(255)    NOT NULL,
    List_Prc                money           NOT NULL,
    Crtd_By                 varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp                timestamp       NOT NULL,
    CONSTRAINT ProductConfigurationPK PRIMARY KEY NONCLUSTERED (Prdct_Cnfig_ID)
)

go


IF OBJECT_ID('Prdct_Cnfig') IS NOT NULL
    PRINT '<<< CREATED TABLE Prdct_Cnfig >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Prdct_Cnfig >>>'
go

/* 
 * TABLE: Prdct_Discnt 
 */

CREATE TABLE Prdct_Discnt(
    Prdct_Discnt_ID    int            IDENTITY(1,1),
    Discnt_Lvl_ID      int            NOT NULL,
    Prdct_Cnfig_ID     int            NOT NULL,
    Lbl                varchar(30)    NOT NULL,
    Strt_Dte           date           NULL,
    End_Dte            date           NULL,
    Crtd_By            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT ProductDiscountPK PRIMARY KEY NONCLUSTERED (Prdct_Discnt_ID)
)

go


IF OBJECT_ID('Prdct_Discnt') IS NOT NULL
    PRINT '<<< CREATED TABLE Prdct_Discnt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Prdct_Discnt >>>'
go

/* 
 * TABLE: Prdct_Typ 
 */

CREATE TABLE Prdct_Typ(
    Prdct_Typ_ID    int             IDENTITY(1,1),
    Nme             varchar(30)     NOT NULL,
    Dscrptn         varchar(255)    NULL,
    Is_Dflt         Boolean         NOT NULL,
    Is_Nw_Licns     Boolean         NOT NULL,
    Crtd_By         varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp        timestamp       NOT NULL,
    CONSTRAINT ProductTypePK PRIMARY KEY NONCLUSTERED (Prdct_Typ_ID)
)

go


IF OBJECT_ID('Prdct_Typ') IS NOT NULL
    PRINT '<<< CREATED TABLE Prdct_Typ >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Prdct_Typ >>>'
go

/* 
 * TABLE: Prdct_Vrsn 
 */

CREATE TABLE Prdct_Vrsn(
    Prdct_Vrsn_ID    int            IDENTITY(1,1),
    Prdct_ID         int            NOT NULL,
    Vrsn_Nbr         varchar(30)    NOT NULL,
    Lbl              varchar(30)    NULL,
    Is_Dflt          Boolean        NOT NULL,
    Is_Supprtd       Boolean        NOT NULL,
    Crtd_By          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT ProductVersionPK PRIMARY KEY NONCLUSTERED (Prdct_Vrsn_ID)
)

go


IF OBJECT_ID('Prdct_Vrsn') IS NOT NULL
    PRINT '<<< CREATED TABLE Prdct_Vrsn >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Prdct_Vrsn >>>'
go

/* 
 * TABLE: Prdct_Vrsn_Pltfrm 
 */

CREATE TABLE Prdct_Vrsn_Pltfrm(
    Prdct_Vrsn_Pltfrm_ID    int            IDENTITY(1,1),
    DB_Pltfrm_ID            int            NOT NULL,
    Prdct_Vrsn_ID           int            NOT NULL,
    Lbl                     varchar(30)    NOT NULL,
    RwTmStmp                timestamp      NOT NULL,
    CONSTRAINT PK147 PRIMARY KEY NONCLUSTERED (Prdct_Vrsn_Pltfrm_ID)
)

go


IF OBJECT_ID('Prdct_Vrsn_Pltfrm') IS NOT NULL
    PRINT '<<< CREATED TABLE Prdct_Vrsn_Pltfrm >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Prdct_Vrsn_Pltfrm >>>'
go

/* 
 * TABLE: Prt 
 */

CREATE TABLE Prt(
    Prt_ID      int             IDENTITY(1,1),
    Nme         varchar(30)     NOT NULL,
    Dscrptn     varchar(255)    NULL,
    RwTmStmp    timestamp       NOT NULL,
    CONSTRAINT PK152 PRIMARY KEY NONCLUSTERED (Prt_ID)
)

go


IF OBJECT_ID('Prt') IS NOT NULL
    PRINT '<<< CREATED TABLE Prt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Prt >>>'
go

/* 
 * TABLE: Pymnt_Dtl 
 */

CREATE TABLE Pymnt_Dtl(
    Pymnt_Dtl_ID         int             IDENTITY(1,1),
    Pymnt_Dtl_Typ_ID     int             NOT NULL,
    Sls_Ordr_Pymnt_ID    int             NOT NULL,
    Lbl                  varchar(30)     NULL,
    Pymnt_Dtl            varchar(255)    NOT NULL,
    Crtd_By              varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp             timestamp       NOT NULL,
    CONSTRAINT PaymentDetailPK PRIMARY KEY NONCLUSTERED (Pymnt_Dtl_ID)
)

go


IF OBJECT_ID('Pymnt_Dtl') IS NOT NULL
    PRINT '<<< CREATED TABLE Pymnt_Dtl >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Pymnt_Dtl >>>'
go

/* 
 * TABLE: Pymnt_Dtl_Typ 
 */

CREATE TABLE Pymnt_Dtl_Typ(
    Pymnt_Dtl_Typ_ID    int             IDENTITY(1,1),
    Pymnt_Mthd_ID       int             NOT NULL,
    Seqnce_Nbr          int             NOT NULL,
    Nme                 varchar(30)     NOT NULL,
    Dscrptn             varchar(255)    NULL,
    Mn_Lngth            int             NOT NULL,
    Mx_Lngth            int             NOT NULL,
    Is_Mndtry           Boolean         NOT NULL,
    Crtd_By             varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp            timestamp       NOT NULL,
    CONSTRAINT PaymentDetailTypePK PRIMARY KEY NONCLUSTERED (Pymnt_Dtl_Typ_ID)
)

go


IF OBJECT_ID('Pymnt_Dtl_Typ') IS NOT NULL
    PRINT '<<< CREATED TABLE Pymnt_Dtl_Typ >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Pymnt_Dtl_Typ >>>'
go

/* 
 * TABLE: Pymnt_Mthd 
 */

CREATE TABLE Pymnt_Mthd(
    Pymnt_Mthd_ID    int             IDENTITY(1,1),
    Nme              varchar(30)     NOT NULL,
    Dscrptn          varchar(255)    NULL,
    Is_Dflt          Boolean         NOT NULL,
    Crtd_By          varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp       NOT NULL,
    CONSTRAINT PaymentTypePK PRIMARY KEY NONCLUSTERED (Pymnt_Mthd_ID)
)

go


IF OBJECT_ID('Pymnt_Mthd') IS NOT NULL
    PRINT '<<< CREATED TABLE Pymnt_Mthd >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Pymnt_Mthd >>>'
go

/* 
 * TABLE: Shppng_Crt 
 */

CREATE TABLE Shppng_Crt(
    Shppng_Crt_ID    int            IDENTITY(1,1),
    Is_Prcssd        Boolean        NOT NULL,
    Crte_Dte         datetime       NOT NULL,
    Crtd_By          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT PK146 PRIMARY KEY NONCLUSTERED (Shppng_Crt_ID)
)

go


IF OBJECT_ID('Shppng_Crt') IS NOT NULL
    PRINT '<<< CREATED TABLE Shppng_Crt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Shppng_Crt >>>'
go

/* 
 * TABLE: Shppng_Crt_Dtl 
 */

CREATE TABLE Shppng_Crt_Dtl(
    Shppng_Crt_Dtl_ID    int          IDENTITY(1,1),
    Shppng_Crt_ID        int          NOT NULL,
    Prdct_Cnfig_ID       int          NOT NULL,
    Qntty                int          NOT NULL,
    List_Prc             money        NOT NULL,
    Unt_Prc              money        NOT NULL,
    RwTmStmp             timestamp    NOT NULL,
    CONSTRAINT ShoppingCartPK PRIMARY KEY NONCLUSTERED (Shppng_Crt_Dtl_ID)
)

go


IF OBJECT_ID('Shppng_Crt_Dtl') IS NOT NULL
    PRINT '<<< CREATED TABLE Shppng_Crt_Dtl >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Shppng_Crt_Dtl >>>'
go

/* 
 * TABLE: Shppng_Instructn 
 */

CREATE TABLE Shppng_Instructn(
    Shppng_Instructn_ID    int             IDENTITY(1,1),
    Sls_Ordr_ID            int             NOT NULL,
    Shppng_Mthd_ID         int             NOT NULL,
    Car_Nme                varchar(30)     NULL,
    Car_Accnt_Nbr          varchar(30)     NULL,
    Dlvry_Mthd             varchar(30)     NULL,
    Dlvry_Instructns       varchar(255)    NULL,
    Crtd_By                varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp               timestamp       NOT NULL,
    CONSTRAINT ShippingInstructionPK PRIMARY KEY NONCLUSTERED (Shppng_Instructn_ID)
)

go


IF OBJECT_ID('Shppng_Instructn') IS NOT NULL
    PRINT '<<< CREATED TABLE Shppng_Instructn >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Shppng_Instructn >>>'
go

/* 
 * TABLE: Shppng_Mthd 
 */

CREATE TABLE Shppng_Mthd(
    Shppng_Mthd_ID     int             IDENTITY(1,1),
    Nme                varchar(30)     NOT NULL,
    Dscrptn            varchar(255)    NULL,
    Shppng_Chrg        money           NOT NULL,
    Is_Dflt            Boolean         NOT NULL,
    Is_Custmr_Spcfd    Boolean         NOT NULL,
    Crtd_By            varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp       NOT NULL,
    CONSTRAINT ShippingMethodPK PRIMARY KEY NONCLUSTERED (Shppng_Mthd_ID)
)

go


IF OBJECT_ID('Shppng_Mthd') IS NOT NULL
    PRINT '<<< CREATED TABLE Shppng_Mthd >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Shppng_Mthd >>>'
go

/* 
 * TABLE: Sls_Ordr 
 */

CREATE TABLE Sls_Ordr(
    Sls_Ordr_ID        int            IDENTITY(1,1),
    Shppng_Crt_ID      int            NOT NULL,
    Sls_Tax_Rate_ID    int            NULL,
    Sls_Ordr_Typ_ID    int            NOT NULL,
    Custmr_ID          int            NOT NULL,
    Sl_Dt              date           NULL,
    Is_Txbl            Boolean        NOT NULL,
    Sls_Tax            money          NOT NULL,
    Crtd_By            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT SalesOrderPK PRIMARY KEY NONCLUSTERED (Sls_Ordr_ID)
)

go


IF OBJECT_ID('Sls_Ordr') IS NOT NULL
    PRINT '<<< CREATED TABLE Sls_Ordr >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sls_Ordr >>>'
go

/* 
 * TABLE: Sls_Ordr_Addr 
 */

CREATE TABLE Sls_Ordr_Addr(
    Sls_Ordr_Addr_ID    int            IDENTITY(1,1),
    Addr_Role_ID        int            NOT NULL,
    Sls_Ordr_ID         int            NOT NULL,
    Custmr_Addr_ID      int            NOT NULL,
    Lbl                 varchar(30)    NULL,
    Crtd_By             varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp            timestamp      NOT NULL,
    CONSTRAINT SalesOrderAddressPK PRIMARY KEY NONCLUSTERED (Sls_Ordr_Addr_ID)
)

go


IF OBJECT_ID('Sls_Ordr_Addr') IS NOT NULL
    PRINT '<<< CREATED TABLE Sls_Ordr_Addr >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sls_Ordr_Addr >>>'
go

/* 
 * TABLE: Sls_Ordr_Line 
 */

CREATE TABLE Sls_Ordr_Line(
    Sls_Ordr_Line_ID     int            IDENTITY(1,1),
    Shppng_Crt_Dtl_ID    int            NOT NULL,
    Prdct_Cnfig_ID       int            NOT NULL,
    Sls_Ordr_ID          int            NOT NULL,
    Qntty                int            NOT NULL,
    List_Prc             money          NOT NULL,
    Unt_Prc              money          NOT NULL,
    Extndd_Prc           money          NOT NULL,
    Crtd_By              varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp             timestamp      NOT NULL,
    CONSTRAINT SalesOrderLinePK PRIMARY KEY NONCLUSTERED (Sls_Ordr_Line_ID)
)

go


IF OBJECT_ID('Sls_Ordr_Line') IS NOT NULL
    PRINT '<<< CREATED TABLE Sls_Ordr_Line >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sls_Ordr_Line >>>'
go

/* 
 * TABLE: Sls_Ordr_Pymnt 
 */

CREATE TABLE Sls_Ordr_Pymnt(
    Sls_Ordr_Pymnt_ID    int            IDENTITY(1,1),
    Pymnt_Mthd_ID        int            NOT NULL,
    Sls_Ordr_ID          int            NOT NULL,
    Amnt                 money          NOT NULL,
    Crtd_By              varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp             timestamp      NOT NULL,
    CONSTRAINT SalesOrderPaymentPK PRIMARY KEY NONCLUSTERED (Sls_Ordr_Pymnt_ID)
)

go


IF OBJECT_ID('Sls_Ordr_Pymnt') IS NOT NULL
    PRINT '<<< CREATED TABLE Sls_Ordr_Pymnt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sls_Ordr_Pymnt >>>'
go

/* 
 * TABLE: Sls_Ordr_Typ 
 */

CREATE TABLE Sls_Ordr_Typ(
    Sls_Ordr_Typ_ID    int             IDENTITY(1,1),
    Nme                varchar(30)     NOT NULL,
    Dscrptn            varchar(255)    NULL,
    Crtd_By            varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp       NOT NULL,
    CONSTRAINT SalesOrderTypePK PRIMARY KEY NONCLUSTERED (Sls_Ordr_Typ_ID)
)

go


IF OBJECT_ID('Sls_Ordr_Typ') IS NOT NULL
    PRINT '<<< CREATED TABLE Sls_Ordr_Typ >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sls_Ordr_Typ >>>'
go

/* 
 * TABLE: Sls_Tax_Rate 
 */

CREATE TABLE Sls_Tax_Rate(
    Sls_Tax_Rate_ID    int            IDENTITY(1,1),
    Zp_Cde_ID          int            NOT NULL,
    Grss_Tx_Rt         tinyint        NOT NULL,
    Crtd_By            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp           timestamp      NOT NULL,
    CONSTRAINT SalesTaxRatePK PRIMARY KEY NONCLUSTERED (Sls_Tax_Rate_ID)
)

go


IF OBJECT_ID('Sls_Tax_Rate') IS NOT NULL
    PRINT '<<< CREATED TABLE Sls_Tax_Rate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sls_Tax_Rate >>>'
go

/* 
 * TABLE: Slsprsn 
 */

CREATE TABLE Slsprsn(
    Slsprsn_ID    int             IDENTITY(1,1),
    Nme           varchar(30)     NOT NULL,
    Dscrptn       varchar(255)    NULL,
    Crtd_By       varchar(30)     DEFAULT GETUSER() NOT NULL,
    RwTmStmp      timestamp       NOT NULL,
    CONSTRAINT SalespersonPK PRIMARY KEY NONCLUSTERED (Slsprsn_ID)
)

go


IF OBJECT_ID('Slsprsn') IS NOT NULL
    PRINT '<<< CREATED TABLE Slsprsn >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Slsprsn >>>'
go

/* 
 * TABLE: Txbl_Prdct 
 */

CREATE TABLE Txbl_Prdct(
    Txbl_Prdct_ID     int            IDENTITY(1,1),
    Prdct_Cnfig_ID    int            NOT NULL,
    Txbl_State_ID     int            NOT NULL,
    Lbl               varchar(30)    NULL,
    Txbl_Shr          tinyint        NOT NULL,
    Crtd_By           varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp          timestamp      NOT NULL,
    CONSTRAINT TaxableProductID PRIMARY KEY NONCLUSTERED (Txbl_Prdct_ID)
)

go


IF OBJECT_ID('Txbl_Prdct') IS NOT NULL
    PRINT '<<< CREATED TABLE Txbl_Prdct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Txbl_Prdct >>>'
go

/* 
 * TABLE: Txbl_State 
 */

CREATE TABLE Txbl_State(
    Txbl_State_ID    int            IDENTITY(1,1),
    Nme              varchar(30)    NOT NULL,
    State_Cd         char(2)        NOT NULL,
    Crtd_By          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT TaxableStatePK PRIMARY KEY NONCLUSTERED (Txbl_State_ID)
)

go


IF OBJECT_ID('Txbl_State') IS NOT NULL
    PRINT '<<< CREATED TABLE Txbl_State >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Txbl_State >>>'
go

/* 
 * TABLE: Usr_Cnt 
 */

CREATE TABLE Usr_Cnt(
    Usr_Cnt_ID    int            IDENTITY(1,1),
    Nme           varchar(30)    NOT NULL,
    Qntty         int            NULL,
    Is_Unlmtd     Boolean        NOT NULL,
    RwTmStmp      timestamp      NOT NULL,
    CONSTRAINT PK151 PRIMARY KEY NONCLUSTERED (Usr_Cnt_ID)
)

go


IF OBJECT_ID('Usr_Cnt') IS NOT NULL
    PRINT '<<< CREATED TABLE Usr_Cnt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Usr_Cnt >>>'
go

/* 
 * TABLE: Zp_Cde 
 */

CREATE TABLE Zp_Cde(
    Zp_Cde_ID        int            IDENTITY(1,1),
    Txbl_State_ID    int            NOT NULL,
    Zp_Cde           char(5)        NOT NULL,
    Crtd_By          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RwTmStmp         timestamp      NOT NULL,
    CONSTRAINT ZipCodePK PRIMARY KEY NONCLUSTERED (Zp_Cde_ID)
)

go


IF OBJECT_ID('Zp_Cde') IS NOT NULL
    PRINT '<<< CREATED TABLE Zp_Cde >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Zp_Cde >>>'
go

/* 
 * TABLE: Addr_Dtl 
 */

ALTER TABLE Addr_Dtl ADD CONSTRAINT RefCustmr_Addr31 
    FOREIGN KEY (Custmr_Addr_ID)
    REFERENCES Custmr_Addr(Custmr_Addr_ID)
go

ALTER TABLE Addr_Dtl ADD CONSTRAINT RefAddr_Typ_Cmpnnt36 
    FOREIGN KEY (Addr_Typ_Cmpnnt_ID)
    REFERENCES Addr_Typ_Cmpnnt(Addr_Typ_Cmpnnt_ID)
go


/* 
 * TABLE: Addr_Typ_Cmpnnt 
 */

ALTER TABLE Addr_Typ_Cmpnnt ADD CONSTRAINT RefAddr_Typ4 
    FOREIGN KEY (Addr_Typ_ID)
    REFERENCES Addr_Typ(Addr_Typ_ID)
go

ALTER TABLE Addr_Typ_Cmpnnt ADD CONSTRAINT RefAddr_Cmpnnt21 
    FOREIGN KEY (Addr_Cmpnnt_ID)
    REFERENCES Addr_Cmpnnt(Addr_Cmpnnt_ID)
go


/* 
 * TABLE: Authrzd_Prdct_Discnt 
 */

ALTER TABLE Authrzd_Prdct_Discnt ADD CONSTRAINT RefPrdct_Discnt29 
    FOREIGN KEY (Prdct_Discnt_ID)
    REFERENCES Prdct_Discnt(Prdct_Discnt_ID)
go

ALTER TABLE Authrzd_Prdct_Discnt ADD CONSTRAINT RefApp_Usr13 
    FOREIGN KEY (App_Usr_ID)
    REFERENCES App_Usr(App_Usr_ID)
go


/* 
 * TABLE: Bill_Mtrls 
 */

ALTER TABLE Bill_Mtrls ADD CONSTRAINT RefPrdct_Cnfig30 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig(Prdct_Cnfig_ID)
go

ALTER TABLE Bill_Mtrls ADD CONSTRAINT RefPrt1 
    FOREIGN KEY (Prt_ID)
    REFERENCES Prt(Prt_ID)
go


/* 
 * TABLE: Cmmssn_Credt 
 */

ALTER TABLE Cmmssn_Credt ADD CONSTRAINT RefSls_Ordr39 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr(Sls_Ordr_ID)
go

ALTER TABLE Cmmssn_Credt ADD CONSTRAINT RefSlsprsn10 
    FOREIGN KEY (Slsprsn_ID)
    REFERENCES Slsprsn(Slsprsn_ID)
go


/* 
 * TABLE: Custmr_Addr 
 */

ALTER TABLE Custmr_Addr ADD CONSTRAINT RefCustmr12 
    FOREIGN KEY (Custmr_ID)
    REFERENCES Custmr(Custmr_ID)
go

ALTER TABLE Custmr_Addr ADD CONSTRAINT RefAddr_Typ14 
    FOREIGN KEY (Addr_Typ_ID)
    REFERENCES Addr_Typ(Addr_Typ_ID)
go


/* 
 * TABLE: Custmr_Phn 
 */

ALTER TABLE Custmr_Phn ADD CONSTRAINT RefCustmr41 
    FOREIGN KEY (Custmr_ID)
    REFERENCES Custmr(Custmr_ID)
go

ALTER TABLE Custmr_Phn ADD CONSTRAINT RefPhn_Role16 
    FOREIGN KEY (Phn_Role_ID)
    REFERENCES Phn_Role(Phn_Role_ID)
go


/* 
 * TABLE: Prdct_Cnfig 
 */

ALTER TABLE Prdct_Cnfig ADD CONSTRAINT RefPrdct_Typ5 
    FOREIGN KEY (Prdct_Typ_ID)
    REFERENCES Prdct_Typ(Prdct_Typ_ID)
go

ALTER TABLE Prdct_Cnfig ADD CONSTRAINT RefPrdct_Vrsn_Pltfrm11 
    FOREIGN KEY (Prdct_Vrsn_Pltfrm_ID)
    REFERENCES Prdct_Vrsn_Pltfrm(Prdct_Vrsn_Pltfrm_ID)
go

ALTER TABLE Prdct_Cnfig ADD CONSTRAINT RefUsr_Cnt19 
    FOREIGN KEY (Usr_Cnt_ID)
    REFERENCES Usr_Cnt(Usr_Cnt_ID)
go


/* 
 * TABLE: Prdct_Discnt 
 */

ALTER TABLE Prdct_Discnt ADD CONSTRAINT RefPrdct_Cnfig38 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig(Prdct_Cnfig_ID)
go

ALTER TABLE Prdct_Discnt ADD CONSTRAINT RefDiscnt_Lvl9 
    FOREIGN KEY (Discnt_Lvl_ID)
    REFERENCES Discnt_Lvl(Discnt_Lvl_ID)
go


/* 
 * TABLE: Prdct_Vrsn 
 */

ALTER TABLE Prdct_Vrsn ADD CONSTRAINT RefPrdct32 
    FOREIGN KEY (Prdct_ID)
    REFERENCES Prdct(Prdct_ID)
go


/* 
 * TABLE: Prdct_Vrsn_Pltfrm 
 */

ALTER TABLE Prdct_Vrsn_Pltfrm ADD CONSTRAINT RefPrdct_Vrsn24 
    FOREIGN KEY (Prdct_Vrsn_ID)
    REFERENCES Prdct_Vrsn(Prdct_Vrsn_ID)
go

ALTER TABLE Prdct_Vrsn_Pltfrm ADD CONSTRAINT RefDB_Pltfrm40 
    FOREIGN KEY (DB_Pltfrm_ID)
    REFERENCES DB_Pltfrm(DB_Pltfrm_ID)
go


/* 
 * TABLE: Pymnt_Dtl 
 */

ALTER TABLE Pymnt_Dtl ADD CONSTRAINT RefSls_Ordr_Pymnt28 
    FOREIGN KEY (Sls_Ordr_Pymnt_ID)
    REFERENCES Sls_Ordr_Pymnt(Sls_Ordr_Pymnt_ID)
go

ALTER TABLE Pymnt_Dtl ADD CONSTRAINT RefPymnt_Dtl_Typ45 
    FOREIGN KEY (Pymnt_Dtl_Typ_ID)
    REFERENCES Pymnt_Dtl_Typ(Pymnt_Dtl_Typ_ID)
go


/* 
 * TABLE: Pymnt_Dtl_Typ 
 */

ALTER TABLE Pymnt_Dtl_Typ ADD CONSTRAINT RefPymnt_Mthd7 
    FOREIGN KEY (Pymnt_Mthd_ID)
    REFERENCES Pymnt_Mthd(Pymnt_Mthd_ID)
go


/* 
 * TABLE: Shppng_Crt_Dtl 
 */

ALTER TABLE Shppng_Crt_Dtl ADD CONSTRAINT RefPrdct_Cnfig26 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig(Prdct_Cnfig_ID)
go

ALTER TABLE Shppng_Crt_Dtl ADD CONSTRAINT RefShppng_Crt8 
    FOREIGN KEY (Shppng_Crt_ID)
    REFERENCES Shppng_Crt(Shppng_Crt_ID)
go


/* 
 * TABLE: Shppng_Instructn 
 */

ALTER TABLE Shppng_Instructn ADD CONSTRAINT RefShppng_Mthd44 
    FOREIGN KEY (Shppng_Mthd_ID)
    REFERENCES Shppng_Mthd(Shppng_Mthd_ID)
go

ALTER TABLE Shppng_Instructn ADD CONSTRAINT RefSls_Ordr17 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr(Sls_Ordr_ID)
go


/* 
 * TABLE: Sls_Ordr 
 */

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefCustmr35 
    FOREIGN KEY (Custmr_ID)
    REFERENCES Custmr(Custmr_ID)
go

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefShppng_Crt37 
    FOREIGN KEY (Shppng_Crt_ID)
    REFERENCES Shppng_Crt(Shppng_Crt_ID)
go

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefSls_Tax_Rate15 
    FOREIGN KEY (Sls_Tax_Rate_ID)
    REFERENCES Sls_Tax_Rate(Sls_Tax_Rate_ID)
go

ALTER TABLE Sls_Ordr ADD CONSTRAINT RefSls_Ordr_Typ20 
    FOREIGN KEY (Sls_Ordr_Typ_ID)
    REFERENCES Sls_Ordr_Typ(Sls_Ordr_Typ_ID)
go


/* 
 * TABLE: Sls_Ordr_Addr 
 */

ALTER TABLE Sls_Ordr_Addr ADD CONSTRAINT RefSls_Ordr25 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr(Sls_Ordr_ID)
go

ALTER TABLE Sls_Ordr_Addr ADD CONSTRAINT RefCustmr_Addr27 
    FOREIGN KEY (Custmr_Addr_ID)
    REFERENCES Custmr_Addr(Custmr_Addr_ID)
go

ALTER TABLE Sls_Ordr_Addr ADD CONSTRAINT RefAddr_Role18 
    FOREIGN KEY (Addr_Role_ID)
    REFERENCES Addr_Role(Addr_Role_ID)
go


/* 
 * TABLE: Sls_Ordr_Line 
 */

ALTER TABLE Sls_Ordr_Line ADD CONSTRAINT RefSls_Ordr22 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr(Sls_Ordr_ID)
go

ALTER TABLE Sls_Ordr_Line ADD CONSTRAINT RefPrdct_Cnfig23 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig(Prdct_Cnfig_ID)
go

ALTER TABLE Sls_Ordr_Line ADD CONSTRAINT RefShppng_Crt_Dtl43 
    FOREIGN KEY (Shppng_Crt_Dtl_ID)
    REFERENCES Shppng_Crt_Dtl(Shppng_Crt_Dtl_ID)
go


/* 
 * TABLE: Sls_Ordr_Pymnt 
 */

ALTER TABLE Sls_Ordr_Pymnt ADD CONSTRAINT RefSls_Ordr34 
    FOREIGN KEY (Sls_Ordr_ID)
    REFERENCES Sls_Ordr(Sls_Ordr_ID)
go

ALTER TABLE Sls_Ordr_Pymnt ADD CONSTRAINT RefPymnt_Mthd3 
    FOREIGN KEY (Pymnt_Mthd_ID)
    REFERENCES Pymnt_Mthd(Pymnt_Mthd_ID)
go


/* 
 * TABLE: Sls_Tax_Rate 
 */

ALTER TABLE Sls_Tax_Rate ADD CONSTRAINT RefZp_Cde42 
    FOREIGN KEY (Zp_Cde_ID)
    REFERENCES Zp_Cde(Zp_Cde_ID)
go


/* 
 * TABLE: Txbl_Prdct 
 */

ALTER TABLE Txbl_Prdct ADD CONSTRAINT RefPrdct_Cnfig2 
    FOREIGN KEY (Prdct_Cnfig_ID)
    REFERENCES Prdct_Cnfig(Prdct_Cnfig_ID)
go

ALTER TABLE Txbl_Prdct ADD CONSTRAINT RefTxbl_State6 
    FOREIGN KEY (Txbl_State_ID)
    REFERENCES Txbl_State(Txbl_State_ID)
go


/* 
 * TABLE: Zp_Cde 
 */

ALTER TABLE Zp_Cde ADD CONSTRAINT RefTxbl_State33 
    FOREIGN KEY (Txbl_State_ID)
    REFERENCES Txbl_State(Txbl_State_ID)
go


