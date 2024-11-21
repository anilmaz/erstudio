/*
 * ER/Studio Data Architect SQL Code Generation
 * Company :      IDERA
 * Project :      Sales Order Processing
 * Author :       Product Management
 *
 * Date Created : Thursday, November 21, 2024 14:23:38
 * Target DBMS : Microsoft Azure SQL DB
 */

CREATE TYPE Boolean FROM bit NOT NULL
go

/* 
 * TABLE: ADDR_CMPNNT 
 */

CREATE TABLE ADDR_CMPNNT(
    ADDR_CMPNNT_ID    int             IDENTITY(1,1),
    NME               varchar(30)     NOT NULL,
    DSCRPTN           varchar(255)    NOT NULL,
    MX_LNGTH          int             NOT NULL,
    LIST_ORDR         int             NULL,
    IS_SYSTM_RQURD    Boolean         NOT NULL,
    CRTD_BY           varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP          timestamp       NOT NULL,
    CONSTRAINT AddressComponentPK PRIMARY KEY NONCLUSTERED (ADDR_CMPNNT_ID)
)

go


IF OBJECT_ID('ADDR_CMPNNT') IS NOT NULL
    PRINT '<<< CREATED TABLE ADDR_CMPNNT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADDR_CMPNNT >>>'
go

/* 
 * TABLE: ADDR_DTL 
 */

CREATE TABLE ADDR_DTL(
    ADDR_DTL_ID           int            IDENTITY(1,1),
    ADDR_TYP_CMPNNT_ID    int            NOT NULL,
    CUSTMR_ADDR_ID        int            NOT NULL,
    LBL                   varchar(30)    NULL,
    ADDR                  varchar(40)    NOT NULL,
    ADDR2                 varchar(40)    NOT NULL,
    CTY                   varchar(30)    NOT NULL,
    STATE                 char(2)        NOT NULL,
    ZP_CDE                char(5)        NOT NULL,
    ZP_CDE_EXTNSN         char(4)        NOT NULL,
    CRTD_BY               varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP              timestamp      NOT NULL,
    CONSTRAINT AddressDetailPK PRIMARY KEY NONCLUSTERED (ADDR_DTL_ID)
)

go


IF OBJECT_ID('ADDR_DTL') IS NOT NULL
    PRINT '<<< CREATED TABLE ADDR_DTL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADDR_DTL >>>'
go

/* 
 * TABLE: ADDR_ROLE 
 */

CREATE TABLE ADDR_ROLE(
    ADDR_ROLE_ID    int             IDENTITY(1,1),
    NME             varchar(30)     NOT NULL,
    DSCRPTN         varchar(255)    NULL,
    CRTD_BY         varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP        timestamp       NOT NULL,
    CONSTRAINT AddressRolePK PRIMARY KEY NONCLUSTERED (ADDR_ROLE_ID)
)

go


IF OBJECT_ID('ADDR_ROLE') IS NOT NULL
    PRINT '<<< CREATED TABLE ADDR_ROLE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADDR_ROLE >>>'
go

/* 
 * TABLE: ADDR_TYP 
 */

CREATE TABLE ADDR_TYP(
    ADDR_TYP_ID    int             IDENTITY(1,1),
    NME            varchar(30)     NOT NULL,
    DSCRPTN        varchar(255)    NULL,
    IS_DFLT        Boolean         NOT NULL,
    CRTD_BY        varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP       timestamp       NOT NULL,
    CONSTRAINT AddressTypePK PRIMARY KEY NONCLUSTERED (ADDR_TYP_ID)
)

go


IF OBJECT_ID('ADDR_TYP') IS NOT NULL
    PRINT '<<< CREATED TABLE ADDR_TYP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADDR_TYP >>>'
go

/* 
 * TABLE: ADDR_TYP_CMPNNT 
 */

CREATE TABLE ADDR_TYP_CMPNNT(
    ADDR_TYP_CMPNNT_ID    int            IDENTITY(1,1),
    ADDR_CMPNNT_ID        int            NOT NULL,
    ADDR_TYP_ID           int            NOT NULL,
    SEQNCE_NBR            int            NOT NULL,
    LBL                   varchar(30)    NOT NULL,
    MN_RWS                int            NOT NULL,
    MX_RWS                int            NULL,
    ENFRC_MX_RWS          Boolean        NOT NULL,
    IS_MNDTRY             Boolean        NOT NULL,
    IS_SYSTM_RQURD        Boolean        NOT NULL,
    CRTD_BY               varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP              timestamp      NOT NULL,
    CONSTRAINT AddressTypeCompPK PRIMARY KEY NONCLUSTERED (ADDR_TYP_CMPNNT_ID)
)

go


IF OBJECT_ID('ADDR_TYP_CMPNNT') IS NOT NULL
    PRINT '<<< CREATED TABLE ADDR_TYP_CMPNNT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADDR_TYP_CMPNNT >>>'
go

/* 
 * TABLE: APP_USR 
 */

CREATE TABLE APP_USR(
    APP_USR_ID    int            IDENTITY(1,1),
    NME           varchar(30)    NOT NULL,
    LGN           varchar(30)    NOT NULL,
    CRTD_BY       varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP      timestamp      NOT NULL,
    CONSTRAINT AppUserPK PRIMARY KEY NONCLUSTERED (APP_USR_ID)
)

go


IF OBJECT_ID('APP_USR') IS NOT NULL
    PRINT '<<< CREATED TABLE APP_USR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE APP_USR >>>'
go

/* 
 * TABLE: AUTHRZD_PRDCT_DISCNT 
 */

CREATE TABLE AUTHRZD_PRDCT_DISCNT(
    AUTH_PRDCT_DISCNT_ID    int            IDENTITY(1,1),
    PRDCT_DISCNT_ID         int            NOT NULL,
    APP_USR_ID              int            NOT NULL,
    LBL                     varchar(30)    NOT NULL,
    STRT_DTE                date           NULL,
    END_DTE                 date           NULL,
    CRTD_BY                 varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP                timestamp      NOT NULL,
    CONSTRAINT AuthProductDiscountPK PRIMARY KEY NONCLUSTERED (AUTH_PRDCT_DISCNT_ID)
)

go


IF OBJECT_ID('AUTHRZD_PRDCT_DISCNT') IS NOT NULL
    PRINT '<<< CREATED TABLE AUTHRZD_PRDCT_DISCNT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AUTHRZD_PRDCT_DISCNT >>>'
go

/* 
 * TABLE: BILL_MTRLS 
 */

CREATE TABLE BILL_MTRLS(
    BILL_MTRLS_ID     int            IDENTITY(1,1),
    PRT_ID            int            NOT NULL,
    PRDCT_CNFIG_ID    int            NOT NULL,
    QNTTY             int            NOT NULL,
    LBL               varchar(30)    NOT NULL,
    RWTMSTMP          timestamp      NOT NULL,
    CONSTRAINT PK153 PRIMARY KEY NONCLUSTERED (BILL_MTRLS_ID)
)

go


IF OBJECT_ID('BILL_MTRLS') IS NOT NULL
    PRINT '<<< CREATED TABLE BILL_MTRLS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE BILL_MTRLS >>>'
go

/* 
 * TABLE: CMMSSN_CREDT 
 */

CREATE TABLE CMMSSN_CREDT(
    CMMSSN_CREDT_ID    int            IDENTITY(1,1),
    SLS_ORDR_ID        int            NOT NULL,
    SLSPRSN_ID         int            NOT NULL,
    CMMSSN_SHR         tinyint        NOT NULL,
    CRTD_BY            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP           timestamp      NOT NULL,
    CONSTRAINT CommissionPK PRIMARY KEY NONCLUSTERED (CMMSSN_CREDT_ID)
)

go


IF OBJECT_ID('CMMSSN_CREDT') IS NOT NULL
    PRINT '<<< CREATED TABLE CMMSSN_CREDT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CMMSSN_CREDT >>>'
go

/* 
 * TABLE: CUSTMR 
 */

CREATE TABLE CUSTMR(
    CUSTMR_ID           int            IDENTITY(1,1),
    FRST_NME            varchar(30)    NOT NULL,
    LST_NME             varchar(30)    NOT NULL,
    CMPNY_NME           varchar(30)    NOT NULL,
    EML_ADDR            varchar(30)    NULL,
    ONYX_ID             varchar(30)    NULL,
    IS_EXSTNG_CUSTMR    Boolean        NOT NULL,
    CRTD_BY             varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP            timestamp      NOT NULL,
    CONSTRAINT CustomerPK PRIMARY KEY NONCLUSTERED (CUSTMR_ID)
)

go


IF OBJECT_ID('CUSTMR') IS NOT NULL
    PRINT '<<< CREATED TABLE CUSTMR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CUSTMR >>>'
go

/* 
 * TABLE: CUSTMR_ADDR 
 */

CREATE TABLE CUSTMR_ADDR(
    CUSTMR_ADDR_ID    int            IDENTITY(1,1),
    ADDR_TYP_ID       int            NOT NULL,
    CUSTMR_ID         int            NOT NULL,
    LBL               varchar(30)    NULL,
    IS_DFLT           Boolean        NOT NULL,
    CRTD_BY           varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP          timestamp      NOT NULL,
    CONSTRAINT CustomerAddressPK PRIMARY KEY NONCLUSTERED (CUSTMR_ADDR_ID)
)

go


IF OBJECT_ID('CUSTMR_ADDR') IS NOT NULL
    PRINT '<<< CREATED TABLE CUSTMR_ADDR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CUSTMR_ADDR >>>'
go

/* 
 * TABLE: CUSTMR_PHN 
 */

CREATE TABLE CUSTMR_PHN(
    CUSTMR_PHN_ID    int            IDENTITY(1,1),
    CUSTMR_ID        int            NOT NULL,
    PHN_ROLE_ID      int            NOT NULL,
    AREA_CDE         char(3)        NOT NULL,
    PHN              char(7)        NOT NULL,
    EXTNSN           varchar(8)     NULL,
    IS_DFLT          Boolean        NOT NULL,
    CRTD_BY          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP         timestamp      NOT NULL,
    CONSTRAINT CustomerPhonePK PRIMARY KEY NONCLUSTERED (CUSTMR_PHN_ID)
)

go


IF OBJECT_ID('CUSTMR_PHN') IS NOT NULL
    PRINT '<<< CREATED TABLE CUSTMR_PHN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CUSTMR_PHN >>>'
go

/* 
 * TABLE: DB_PLTFRM 
 */

CREATE TABLE DB_PLTFRM(
    DB_PLTFRM_ID    int             IDENTITY(1,1),
    NME             varchar(30)     NOT NULL,
    DSCRPTN         varchar(255)    NOT NULL,
    CRTD_BY         varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP        timestamp       NOT NULL,
    CONSTRAINT DBPlatformPK PRIMARY KEY NONCLUSTERED (DB_PLTFRM_ID)
)

go


IF OBJECT_ID('DB_PLTFRM') IS NOT NULL
    PRINT '<<< CREATED TABLE DB_PLTFRM >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DB_PLTFRM >>>'
go

/* 
 * TABLE: DISCNT_LVL 
 */

CREATE TABLE DISCNT_LVL(
    DISCNT_LVL_ID    int            IDENTITY(1,1),
    SEQNCE_NBR       int            NOT NULL,
    DISCNT_PCT       tinyint        NOT NULL,
    STRT_DTE         date           NULL,
    END_DTE          date           NULL,
    CRTD_BY          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP         timestamp      NOT NULL,
    CONSTRAINT DiscountLevelPK PRIMARY KEY NONCLUSTERED (DISCNT_LVL_ID)
)

go


IF OBJECT_ID('DISCNT_LVL') IS NOT NULL
    PRINT '<<< CREATED TABLE DISCNT_LVL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DISCNT_LVL >>>'
go

/* 
 * TABLE: PHN_ROLE 
 */

CREATE TABLE PHN_ROLE(
    PHN_ROLE_ID    int             IDENTITY(1,1),
    NME            varchar(30)     NOT NULL,
    DSCRPTN        varchar(255)    NULL,
    IS_DFLT        Boolean         NOT NULL,
    CRTD_BY        varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP       timestamp       NOT NULL,
    CONSTRAINT PhoneRolePK PRIMARY KEY NONCLUSTERED (PHN_ROLE_ID)
)

go


IF OBJECT_ID('PHN_ROLE') IS NOT NULL
    PRINT '<<< CREATED TABLE PHN_ROLE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PHN_ROLE >>>'
go

/* 
 * TABLE: PRDCT 
 */

CREATE TABLE PRDCT(
    PRDCT_ID    int             IDENTITY(1,1),
    NME         varchar(30)     NOT NULL,
    DSCRPTN     varchar(255)    NOT NULL,
    CRTD_BY     varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP    timestamp       NOT NULL,
    CONSTRAINT ProductPK PRIMARY KEY NONCLUSTERED (PRDCT_ID)
)

go


IF OBJECT_ID('PRDCT') IS NOT NULL
    PRINT '<<< CREATED TABLE PRDCT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRDCT >>>'
go

/* 
 * TABLE: PRDCT_CNFIG 
 */

CREATE TABLE PRDCT_CNFIG(
    PRDCT_CNFIG_ID          int             IDENTITY(1,1),
    PRDCT_TYP_ID            int             NOT NULL,
    USR_CNT_ID              int             NOT NULL,
    PRDCT_VRSN_PLTFRM_ID    int             NOT NULL,
    GRT_PLNS_ID             varchar(30)     NOT NULL,
    DSCRPTN                 varchar(255)    NOT NULL,
    LIST_PRC                money           NOT NULL,
    CRTD_BY                 varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP                timestamp       NOT NULL,
    CONSTRAINT ProductConfigurationPK PRIMARY KEY NONCLUSTERED (PRDCT_CNFIG_ID)
)

go


IF OBJECT_ID('PRDCT_CNFIG') IS NOT NULL
    PRINT '<<< CREATED TABLE PRDCT_CNFIG >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRDCT_CNFIG >>>'
go

/* 
 * TABLE: PRDCT_DISCNT 
 */

CREATE TABLE PRDCT_DISCNT(
    PRDCT_DISCNT_ID    int            IDENTITY(1,1),
    DISCNT_LVL_ID      int            NOT NULL,
    PRDCT_CNFIG_ID     int            NOT NULL,
    LBL                varchar(30)    NOT NULL,
    STRT_DTE           date           NULL,
    END_DTE            date           NULL,
    CRTD_BY            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP           timestamp      NOT NULL,
    CONSTRAINT ProductDiscountPK PRIMARY KEY NONCLUSTERED (PRDCT_DISCNT_ID)
)

go


IF OBJECT_ID('PRDCT_DISCNT') IS NOT NULL
    PRINT '<<< CREATED TABLE PRDCT_DISCNT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRDCT_DISCNT >>>'
go

/* 
 * TABLE: PRDCT_TYP 
 */

CREATE TABLE PRDCT_TYP(
    PRDCT_TYP_ID    int             IDENTITY(1,1),
    NME             varchar(30)     NOT NULL,
    DSCRPTN         varchar(255)    NULL,
    IS_DFLT         Boolean         NOT NULL,
    IS_NW_LICNS     Boolean         NOT NULL,
    CRTD_BY         varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP        timestamp       NOT NULL,
    CONSTRAINT ProductTypePK PRIMARY KEY NONCLUSTERED (PRDCT_TYP_ID)
)

go


IF OBJECT_ID('PRDCT_TYP') IS NOT NULL
    PRINT '<<< CREATED TABLE PRDCT_TYP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRDCT_TYP >>>'
go

/* 
 * TABLE: PRDCT_VRSN 
 */

CREATE TABLE PRDCT_VRSN(
    PRDCT_VRSN_ID    int            IDENTITY(1,1),
    PRDCT_ID         int            NOT NULL,
    VRSN_NBR         varchar(30)    NOT NULL,
    LBL              varchar(30)    NULL,
    IS_DFLT          Boolean        NOT NULL,
    IS_SUPPRTD       Boolean        NOT NULL,
    CRTD_BY          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP         timestamp      NOT NULL,
    CONSTRAINT ProductVersionPK PRIMARY KEY NONCLUSTERED (PRDCT_VRSN_ID)
)

go


IF OBJECT_ID('PRDCT_VRSN') IS NOT NULL
    PRINT '<<< CREATED TABLE PRDCT_VRSN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRDCT_VRSN >>>'
go

/* 
 * TABLE: PRDCT_VRSN_PLTFRM 
 */

CREATE TABLE PRDCT_VRSN_PLTFRM(
    PRDCT_VRSN_PLTFRM_ID    int            IDENTITY(1,1),
    DB_PLTFRM_ID            int            NOT NULL,
    PRDCT_VRSN_ID           int            NOT NULL,
    LBL                     varchar(30)    NOT NULL,
    RWTMSTMP                timestamp      NOT NULL,
    CONSTRAINT PK147 PRIMARY KEY NONCLUSTERED (PRDCT_VRSN_PLTFRM_ID)
)

go


IF OBJECT_ID('PRDCT_VRSN_PLTFRM') IS NOT NULL
    PRINT '<<< CREATED TABLE PRDCT_VRSN_PLTFRM >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRDCT_VRSN_PLTFRM >>>'
go

/* 
 * TABLE: PRT 
 */

CREATE TABLE PRT(
    PRT_ID      int             IDENTITY(1,1),
    NME         varchar(30)     NOT NULL,
    DSCRPTN     varchar(255)    NULL,
    RWTMSTMP    timestamp       NOT NULL,
    CONSTRAINT PK152 PRIMARY KEY NONCLUSTERED (PRT_ID)
)

go


IF OBJECT_ID('PRT') IS NOT NULL
    PRINT '<<< CREATED TABLE PRT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRT >>>'
go

/* 
 * TABLE: PYMNT_DTL 
 */

CREATE TABLE PYMNT_DTL(
    PYMNT_DTL_ID         int             IDENTITY(1,1),
    PYMNT_DTL_TYP_ID     int             NOT NULL,
    SLS_ORDR_PYMNT_ID    int             NOT NULL,
    LBL                  varchar(30)     NULL,
    PYMNT_DTL            varchar(255)    NOT NULL,
    CRTD_BY              varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP             timestamp       NOT NULL,
    CONSTRAINT PaymentDetailPK PRIMARY KEY NONCLUSTERED (PYMNT_DTL_ID)
)

go


IF OBJECT_ID('PYMNT_DTL') IS NOT NULL
    PRINT '<<< CREATED TABLE PYMNT_DTL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PYMNT_DTL >>>'
go

/* 
 * TABLE: PYMNT_DTL_TYP 
 */

CREATE TABLE PYMNT_DTL_TYP(
    PYMNT_DTL_TYP_ID    int             IDENTITY(1,1),
    PYMNT_MTHD_ID       int             NOT NULL,
    SEQNCE_NBR          int             NOT NULL,
    NME                 varchar(30)     NOT NULL,
    DSCRPTN             varchar(255)    NULL,
    MN_LNGTH            int             NOT NULL,
    MX_LNGTH            int             NOT NULL,
    IS_MNDTRY           Boolean         NOT NULL,
    CRTD_BY             varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP            timestamp       NOT NULL,
    CONSTRAINT PaymentDetailTypePK PRIMARY KEY NONCLUSTERED (PYMNT_DTL_TYP_ID)
)

go


IF OBJECT_ID('PYMNT_DTL_TYP') IS NOT NULL
    PRINT '<<< CREATED TABLE PYMNT_DTL_TYP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PYMNT_DTL_TYP >>>'
go

/* 
 * TABLE: PYMNT_MTHD 
 */

CREATE TABLE PYMNT_MTHD(
    PYMNT_MTHD_ID    int             IDENTITY(1,1),
    NME              varchar(30)     NOT NULL,
    DSCRPTN          varchar(255)    NULL,
    IS_DFLT          Boolean         NOT NULL,
    CRTD_BY          varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP         timestamp       NOT NULL,
    CONSTRAINT PaymentTypePK PRIMARY KEY NONCLUSTERED (PYMNT_MTHD_ID)
)

go


IF OBJECT_ID('PYMNT_MTHD') IS NOT NULL
    PRINT '<<< CREATED TABLE PYMNT_MTHD >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PYMNT_MTHD >>>'
go

/* 
 * TABLE: SHPPNG_CRT 
 */

CREATE TABLE SHPPNG_CRT(
    SHPPNG_CRT_ID    int            IDENTITY(1,1),
    IS_PRCSSD        Boolean        NOT NULL,
    CRTE_DTE         datetime       NOT NULL,
    CRTD_BY          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP         timestamp      NOT NULL,
    CONSTRAINT PK146 PRIMARY KEY NONCLUSTERED (SHPPNG_CRT_ID)
)

go


IF OBJECT_ID('SHPPNG_CRT') IS NOT NULL
    PRINT '<<< CREATED TABLE SHPPNG_CRT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SHPPNG_CRT >>>'
go

/* 
 * TABLE: SHPPNG_CRT_DTL 
 */

CREATE TABLE SHPPNG_CRT_DTL(
    SHPPNG_CRT_DTL_ID    int          IDENTITY(1,1),
    SHPPNG_CRT_ID        int          NOT NULL,
    PRDCT_CNFIG_ID       int          NOT NULL,
    QNTTY                int          NOT NULL,
    LIST_PRC             money        NOT NULL,
    UNT_PRC              money        NOT NULL,
    RWTMSTMP             timestamp    NOT NULL,
    CONSTRAINT ShoppingCartPK PRIMARY KEY NONCLUSTERED (SHPPNG_CRT_DTL_ID)
)

go


IF OBJECT_ID('SHPPNG_CRT_DTL') IS NOT NULL
    PRINT '<<< CREATED TABLE SHPPNG_CRT_DTL >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SHPPNG_CRT_DTL >>>'
go

/* 
 * TABLE: SHPPNG_INSTRUCTN 
 */

CREATE TABLE SHPPNG_INSTRUCTN(
    SHPPNG_INSTRUCTN_ID    int             IDENTITY(1,1),
    SLS_ORDR_ID            int             NOT NULL,
    SHPPNG_MTHD_ID         int             NOT NULL,
    CAR_NME                varchar(30)     NULL,
    CAR_ACCNT_NBR          varchar(30)     NULL,
    DLVRY_MTHD             varchar(30)     NULL,
    DLVRY_INSTRUCTNS       varchar(255)    NULL,
    CRTD_BY                varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP               timestamp       NOT NULL,
    CONSTRAINT ShippingInstructionPK PRIMARY KEY NONCLUSTERED (SHPPNG_INSTRUCTN_ID)
)

go


IF OBJECT_ID('SHPPNG_INSTRUCTN') IS NOT NULL
    PRINT '<<< CREATED TABLE SHPPNG_INSTRUCTN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SHPPNG_INSTRUCTN >>>'
go

/* 
 * TABLE: SHPPNG_MTHD 
 */

CREATE TABLE SHPPNG_MTHD(
    SHPPNG_MTHD_ID     int             IDENTITY(1,1),
    NME                varchar(30)     NOT NULL,
    DSCRPTN            varchar(255)    NULL,
    SHPPNG_CHRG        money           NOT NULL,
    IS_DFLT            Boolean         NOT NULL,
    IS_CUSTMR_SPCFD    Boolean         NOT NULL,
    CRTD_BY            varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP           timestamp       NOT NULL,
    CONSTRAINT ShippingMethodPK PRIMARY KEY NONCLUSTERED (SHPPNG_MTHD_ID)
)

go


IF OBJECT_ID('SHPPNG_MTHD') IS NOT NULL
    PRINT '<<< CREATED TABLE SHPPNG_MTHD >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SHPPNG_MTHD >>>'
go

/* 
 * TABLE: SLS_ORDR 
 */

CREATE TABLE SLS_ORDR(
    SLS_ORDR_ID        int            IDENTITY(1,1),
    SHPPNG_CRT_ID      int            NOT NULL,
    SLS_TAX_RATE_ID    int            NULL,
    SLS_ORDR_TYP_ID    int            NOT NULL,
    CUSTMR_ID          int            NOT NULL,
    SL_DT              date           NULL,
    IS_TXBL            Boolean        NOT NULL,
    SLS_TAX            money          NOT NULL,
    CRTD_BY            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP           timestamp      NOT NULL,
    CONSTRAINT SalesOrderPK PRIMARY KEY NONCLUSTERED (SLS_ORDR_ID)
)

go


IF OBJECT_ID('SLS_ORDR') IS NOT NULL
    PRINT '<<< CREATED TABLE SLS_ORDR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SLS_ORDR >>>'
go

/* 
 * TABLE: SLS_ORDR_ADDR 
 */

CREATE TABLE SLS_ORDR_ADDR(
    SLS_ORDR_ADDR_ID    int            IDENTITY(1,1),
    ADDR_ROLE_ID        int            NOT NULL,
    SLS_ORDR_ID         int            NOT NULL,
    CUSTMR_ADDR_ID      int            NOT NULL,
    LBL                 varchar(30)    NULL,
    CRTD_BY             varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP            timestamp      NOT NULL,
    CONSTRAINT SalesOrderAddressPK PRIMARY KEY NONCLUSTERED (SLS_ORDR_ADDR_ID)
)

go


IF OBJECT_ID('SLS_ORDR_ADDR') IS NOT NULL
    PRINT '<<< CREATED TABLE SLS_ORDR_ADDR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SLS_ORDR_ADDR >>>'
go

/* 
 * TABLE: SLS_ORDR_LINE 
 */

CREATE TABLE SLS_ORDR_LINE(
    SLS_ORDR_LINE_ID     int            IDENTITY(1,1),
    SHPPNG_CRT_DTL_ID    int            NOT NULL,
    PRDCT_CNFIG_ID       int            NOT NULL,
    SLS_ORDR_ID          int            NOT NULL,
    QNTTY                int            NOT NULL,
    LIST_PRC             money          NOT NULL,
    UNT_PRC              money          NOT NULL,
    EXTNDD_PRC           money          NOT NULL,
    CRTD_BY              varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP             timestamp      NOT NULL,
    CONSTRAINT SalesOrderLinePK PRIMARY KEY NONCLUSTERED (SLS_ORDR_LINE_ID)
)

go


IF OBJECT_ID('SLS_ORDR_LINE') IS NOT NULL
    PRINT '<<< CREATED TABLE SLS_ORDR_LINE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SLS_ORDR_LINE >>>'
go

/* 
 * TABLE: SLS_ORDR_PYMNT 
 */

CREATE TABLE SLS_ORDR_PYMNT(
    SLS_ORDR_PYMNT_ID    int            IDENTITY(1,1),
    PYMNT_MTHD_ID        int            NOT NULL,
    SLS_ORDR_ID          int            NOT NULL,
    AMNT                 money          NOT NULL,
    CRTD_BY              varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP             timestamp      NOT NULL,
    CONSTRAINT SalesOrderPaymentPK PRIMARY KEY NONCLUSTERED (SLS_ORDR_PYMNT_ID)
)

go


IF OBJECT_ID('SLS_ORDR_PYMNT') IS NOT NULL
    PRINT '<<< CREATED TABLE SLS_ORDR_PYMNT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SLS_ORDR_PYMNT >>>'
go

/* 
 * TABLE: SLS_ORDR_TYP 
 */

CREATE TABLE SLS_ORDR_TYP(
    SLS_ORDR_TYP_ID    int             IDENTITY(1,1),
    NME                varchar(30)     NOT NULL,
    DSCRPTN            varchar(255)    NULL,
    CRTD_BY            varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP           timestamp       NOT NULL,
    CONSTRAINT SalesOrderTypePK PRIMARY KEY NONCLUSTERED (SLS_ORDR_TYP_ID)
)

go


IF OBJECT_ID('SLS_ORDR_TYP') IS NOT NULL
    PRINT '<<< CREATED TABLE SLS_ORDR_TYP >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SLS_ORDR_TYP >>>'
go

/* 
 * TABLE: SLS_TAX_RATE 
 */

CREATE TABLE SLS_TAX_RATE(
    SLS_TAX_RATE_ID    int            IDENTITY(1,1),
    ZP_CDE_ID          int            NOT NULL,
    GRSS_TX_RT         tinyint        NOT NULL,
    CRTD_BY            varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP           timestamp      NOT NULL,
    CONSTRAINT SalesTaxRatePK PRIMARY KEY NONCLUSTERED (SLS_TAX_RATE_ID)
)

go


IF OBJECT_ID('SLS_TAX_RATE') IS NOT NULL
    PRINT '<<< CREATED TABLE SLS_TAX_RATE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SLS_TAX_RATE >>>'
go

/* 
 * TABLE: SLSPRSN 
 */

CREATE TABLE SLSPRSN(
    SLSPRSN_ID    int             IDENTITY(1,1),
    NME           varchar(30)     NOT NULL,
    DSCRPTN       varchar(255)    NULL,
    CRTD_BY       varchar(30)     DEFAULT GETUSER() NOT NULL,
    RWTMSTMP      timestamp       NOT NULL,
    CONSTRAINT SalespersonPK PRIMARY KEY NONCLUSTERED (SLSPRSN_ID)
)

go


IF OBJECT_ID('SLSPRSN') IS NOT NULL
    PRINT '<<< CREATED TABLE SLSPRSN >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SLSPRSN >>>'
go

/* 
 * TABLE: TXBL_PRDCT 
 */

CREATE TABLE TXBL_PRDCT(
    TXBL_PRDCT_ID     int            IDENTITY(1,1),
    PRDCT_CNFIG_ID    int            NOT NULL,
    TXBL_STATE_ID     int            NOT NULL,
    LBL               varchar(30)    NULL,
    TXBL_SHR          tinyint        NOT NULL,
    CRTD_BY           varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP          timestamp      NOT NULL,
    CONSTRAINT TaxableProductID PRIMARY KEY NONCLUSTERED (TXBL_PRDCT_ID)
)

go


IF OBJECT_ID('TXBL_PRDCT') IS NOT NULL
    PRINT '<<< CREATED TABLE TXBL_PRDCT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TXBL_PRDCT >>>'
go

/* 
 * TABLE: TXBL_STATE 
 */

CREATE TABLE TXBL_STATE(
    TXBL_STATE_ID    int            IDENTITY(1,1),
    NME              varchar(30)    NOT NULL,
    STATE_CD         char(2)        NOT NULL,
    CRTD_BY          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP         timestamp      NOT NULL,
    CONSTRAINT TaxableStatePK PRIMARY KEY NONCLUSTERED (TXBL_STATE_ID)
)

go


IF OBJECT_ID('TXBL_STATE') IS NOT NULL
    PRINT '<<< CREATED TABLE TXBL_STATE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TXBL_STATE >>>'
go

/* 
 * TABLE: USR_CNT 
 */

CREATE TABLE USR_CNT(
    USR_CNT_ID    int            IDENTITY(1,1),
    NME           varchar(30)    NOT NULL,
    QNTTY         int            NULL,
    IS_UNLMTD     Boolean        NOT NULL,
    RWTMSTMP      timestamp      NOT NULL,
    CONSTRAINT PK151 PRIMARY KEY NONCLUSTERED (USR_CNT_ID)
)

go


IF OBJECT_ID('USR_CNT') IS NOT NULL
    PRINT '<<< CREATED TABLE USR_CNT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE USR_CNT >>>'
go

/* 
 * TABLE: ZP_CDE 
 */

CREATE TABLE ZP_CDE(
    ZP_CDE_ID        int            IDENTITY(1,1),
    TXBL_STATE_ID    int            NOT NULL,
    ZP_CDE           char(5)        NOT NULL,
    CRTD_BY          varchar(30)    DEFAULT GETUSER() NOT NULL,
    RWTMSTMP         timestamp      NOT NULL,
    CONSTRAINT ZipCodePK PRIMARY KEY NONCLUSTERED (ZP_CDE_ID)
)

go


IF OBJECT_ID('ZP_CDE') IS NOT NULL
    PRINT '<<< CREATED TABLE ZP_CDE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ZP_CDE >>>'
go

/* 
 * TABLE: ADDR_DTL 
 */

ALTER TABLE ADDR_DTL ADD CONSTRAINT RefCUSTMR_ADDR31 
    FOREIGN KEY (CUSTMR_ADDR_ID)
    REFERENCES CUSTMR_ADDR(CUSTMR_ADDR_ID)
go

ALTER TABLE ADDR_DTL ADD CONSTRAINT RefADDR_TYP_CMPNNT36 
    FOREIGN KEY (ADDR_TYP_CMPNNT_ID)
    REFERENCES ADDR_TYP_CMPNNT(ADDR_TYP_CMPNNT_ID)
go


/* 
 * TABLE: ADDR_TYP_CMPNNT 
 */

ALTER TABLE ADDR_TYP_CMPNNT ADD CONSTRAINT RefADDR_TYP4 
    FOREIGN KEY (ADDR_TYP_ID)
    REFERENCES ADDR_TYP(ADDR_TYP_ID)
go

ALTER TABLE ADDR_TYP_CMPNNT ADD CONSTRAINT RefADDR_CMPNNT21 
    FOREIGN KEY (ADDR_CMPNNT_ID)
    REFERENCES ADDR_CMPNNT(ADDR_CMPNNT_ID)
go


/* 
 * TABLE: AUTHRZD_PRDCT_DISCNT 
 */

ALTER TABLE AUTHRZD_PRDCT_DISCNT ADD CONSTRAINT RefAPP_USR13 
    FOREIGN KEY (APP_USR_ID)
    REFERENCES APP_USR(APP_USR_ID)
go

ALTER TABLE AUTHRZD_PRDCT_DISCNT ADD CONSTRAINT RefPRDCT_DISCNT29 
    FOREIGN KEY (PRDCT_DISCNT_ID)
    REFERENCES PRDCT_DISCNT(PRDCT_DISCNT_ID)
go


/* 
 * TABLE: BILL_MTRLS 
 */

ALTER TABLE BILL_MTRLS ADD CONSTRAINT RefPRT1 
    FOREIGN KEY (PRT_ID)
    REFERENCES PRT(PRT_ID)
go

ALTER TABLE BILL_MTRLS ADD CONSTRAINT RefPRDCT_CNFIG30 
    FOREIGN KEY (PRDCT_CNFIG_ID)
    REFERENCES PRDCT_CNFIG(PRDCT_CNFIG_ID)
go


/* 
 * TABLE: CMMSSN_CREDT 
 */

ALTER TABLE CMMSSN_CREDT ADD CONSTRAINT RefSLSPRSN10 
    FOREIGN KEY (SLSPRSN_ID)
    REFERENCES SLSPRSN(SLSPRSN_ID)
go

ALTER TABLE CMMSSN_CREDT ADD CONSTRAINT RefSLS_ORDR39 
    FOREIGN KEY (SLS_ORDR_ID)
    REFERENCES SLS_ORDR(SLS_ORDR_ID)
go


/* 
 * TABLE: CUSTMR_ADDR 
 */

ALTER TABLE CUSTMR_ADDR ADD CONSTRAINT RefCUSTMR12 
    FOREIGN KEY (CUSTMR_ID)
    REFERENCES CUSTMR(CUSTMR_ID)
go

ALTER TABLE CUSTMR_ADDR ADD CONSTRAINT RefADDR_TYP14 
    FOREIGN KEY (ADDR_TYP_ID)
    REFERENCES ADDR_TYP(ADDR_TYP_ID)
go


/* 
 * TABLE: CUSTMR_PHN 
 */

ALTER TABLE CUSTMR_PHN ADD CONSTRAINT RefPHN_ROLE16 
    FOREIGN KEY (PHN_ROLE_ID)
    REFERENCES PHN_ROLE(PHN_ROLE_ID)
go

ALTER TABLE CUSTMR_PHN ADD CONSTRAINT RefCUSTMR41 
    FOREIGN KEY (CUSTMR_ID)
    REFERENCES CUSTMR(CUSTMR_ID)
go


/* 
 * TABLE: PRDCT_CNFIG 
 */

ALTER TABLE PRDCT_CNFIG ADD CONSTRAINT RefPRDCT_TYP5 
    FOREIGN KEY (PRDCT_TYP_ID)
    REFERENCES PRDCT_TYP(PRDCT_TYP_ID)
go

ALTER TABLE PRDCT_CNFIG ADD CONSTRAINT RefPRDCT_VRSN_PLTFRM11 
    FOREIGN KEY (PRDCT_VRSN_PLTFRM_ID)
    REFERENCES PRDCT_VRSN_PLTFRM(PRDCT_VRSN_PLTFRM_ID)
go

ALTER TABLE PRDCT_CNFIG ADD CONSTRAINT RefUSR_CNT19 
    FOREIGN KEY (USR_CNT_ID)
    REFERENCES USR_CNT(USR_CNT_ID)
go


/* 
 * TABLE: PRDCT_DISCNT 
 */

ALTER TABLE PRDCT_DISCNT ADD CONSTRAINT RefDISCNT_LVL9 
    FOREIGN KEY (DISCNT_LVL_ID)
    REFERENCES DISCNT_LVL(DISCNT_LVL_ID)
go

ALTER TABLE PRDCT_DISCNT ADD CONSTRAINT RefPRDCT_CNFIG38 
    FOREIGN KEY (PRDCT_CNFIG_ID)
    REFERENCES PRDCT_CNFIG(PRDCT_CNFIG_ID)
go


/* 
 * TABLE: PRDCT_VRSN 
 */

ALTER TABLE PRDCT_VRSN ADD CONSTRAINT RefPRDCT32 
    FOREIGN KEY (PRDCT_ID)
    REFERENCES PRDCT(PRDCT_ID)
go


/* 
 * TABLE: PRDCT_VRSN_PLTFRM 
 */

ALTER TABLE PRDCT_VRSN_PLTFRM ADD CONSTRAINT RefPRDCT_VRSN24 
    FOREIGN KEY (PRDCT_VRSN_ID)
    REFERENCES PRDCT_VRSN(PRDCT_VRSN_ID)
go

ALTER TABLE PRDCT_VRSN_PLTFRM ADD CONSTRAINT RefDB_PLTFRM40 
    FOREIGN KEY (DB_PLTFRM_ID)
    REFERENCES DB_PLTFRM(DB_PLTFRM_ID)
go


/* 
 * TABLE: PYMNT_DTL 
 */

ALTER TABLE PYMNT_DTL ADD CONSTRAINT RefSLS_ORDR_PYMNT28 
    FOREIGN KEY (SLS_ORDR_PYMNT_ID)
    REFERENCES SLS_ORDR_PYMNT(SLS_ORDR_PYMNT_ID)
go

ALTER TABLE PYMNT_DTL ADD CONSTRAINT RefPYMNT_DTL_TYP45 
    FOREIGN KEY (PYMNT_DTL_TYP_ID)
    REFERENCES PYMNT_DTL_TYP(PYMNT_DTL_TYP_ID)
go


/* 
 * TABLE: PYMNT_DTL_TYP 
 */

ALTER TABLE PYMNT_DTL_TYP ADD CONSTRAINT RefPYMNT_MTHD7 
    FOREIGN KEY (PYMNT_MTHD_ID)
    REFERENCES PYMNT_MTHD(PYMNT_MTHD_ID)
go


/* 
 * TABLE: SHPPNG_CRT_DTL 
 */

ALTER TABLE SHPPNG_CRT_DTL ADD CONSTRAINT RefSHPPNG_CRT8 
    FOREIGN KEY (SHPPNG_CRT_ID)
    REFERENCES SHPPNG_CRT(SHPPNG_CRT_ID)
go

ALTER TABLE SHPPNG_CRT_DTL ADD CONSTRAINT RefPRDCT_CNFIG26 
    FOREIGN KEY (PRDCT_CNFIG_ID)
    REFERENCES PRDCT_CNFIG(PRDCT_CNFIG_ID)
go


/* 
 * TABLE: SHPPNG_INSTRUCTN 
 */

ALTER TABLE SHPPNG_INSTRUCTN ADD CONSTRAINT RefSLS_ORDR17 
    FOREIGN KEY (SLS_ORDR_ID)
    REFERENCES SLS_ORDR(SLS_ORDR_ID)
go

ALTER TABLE SHPPNG_INSTRUCTN ADD CONSTRAINT RefSHPPNG_MTHD44 
    FOREIGN KEY (SHPPNG_MTHD_ID)
    REFERENCES SHPPNG_MTHD(SHPPNG_MTHD_ID)
go


/* 
 * TABLE: SLS_ORDR 
 */

ALTER TABLE SLS_ORDR ADD CONSTRAINT RefSLS_TAX_RATE15 
    FOREIGN KEY (SLS_TAX_RATE_ID)
    REFERENCES SLS_TAX_RATE(SLS_TAX_RATE_ID)
go

ALTER TABLE SLS_ORDR ADD CONSTRAINT RefSLS_ORDR_TYP20 
    FOREIGN KEY (SLS_ORDR_TYP_ID)
    REFERENCES SLS_ORDR_TYP(SLS_ORDR_TYP_ID)
go

ALTER TABLE SLS_ORDR ADD CONSTRAINT RefCUSTMR35 
    FOREIGN KEY (CUSTMR_ID)
    REFERENCES CUSTMR(CUSTMR_ID)
go

ALTER TABLE SLS_ORDR ADD CONSTRAINT RefSHPPNG_CRT37 
    FOREIGN KEY (SHPPNG_CRT_ID)
    REFERENCES SHPPNG_CRT(SHPPNG_CRT_ID)
go


/* 
 * TABLE: SLS_ORDR_ADDR 
 */

ALTER TABLE SLS_ORDR_ADDR ADD CONSTRAINT RefADDR_ROLE18 
    FOREIGN KEY (ADDR_ROLE_ID)
    REFERENCES ADDR_ROLE(ADDR_ROLE_ID)
go

ALTER TABLE SLS_ORDR_ADDR ADD CONSTRAINT RefSLS_ORDR25 
    FOREIGN KEY (SLS_ORDR_ID)
    REFERENCES SLS_ORDR(SLS_ORDR_ID)
go

ALTER TABLE SLS_ORDR_ADDR ADD CONSTRAINT RefCUSTMR_ADDR27 
    FOREIGN KEY (CUSTMR_ADDR_ID)
    REFERENCES CUSTMR_ADDR(CUSTMR_ADDR_ID)
go


/* 
 * TABLE: SLS_ORDR_LINE 
 */

ALTER TABLE SLS_ORDR_LINE ADD CONSTRAINT RefSLS_ORDR22 
    FOREIGN KEY (SLS_ORDR_ID)
    REFERENCES SLS_ORDR(SLS_ORDR_ID)
go

ALTER TABLE SLS_ORDR_LINE ADD CONSTRAINT RefPRDCT_CNFIG23 
    FOREIGN KEY (PRDCT_CNFIG_ID)
    REFERENCES PRDCT_CNFIG(PRDCT_CNFIG_ID)
go

ALTER TABLE SLS_ORDR_LINE ADD CONSTRAINT RefSHPPNG_CRT_DTL43 
    FOREIGN KEY (SHPPNG_CRT_DTL_ID)
    REFERENCES SHPPNG_CRT_DTL(SHPPNG_CRT_DTL_ID)
go


/* 
 * TABLE: SLS_ORDR_PYMNT 
 */

ALTER TABLE SLS_ORDR_PYMNT ADD CONSTRAINT RefPYMNT_MTHD3 
    FOREIGN KEY (PYMNT_MTHD_ID)
    REFERENCES PYMNT_MTHD(PYMNT_MTHD_ID)
go

ALTER TABLE SLS_ORDR_PYMNT ADD CONSTRAINT RefSLS_ORDR34 
    FOREIGN KEY (SLS_ORDR_ID)
    REFERENCES SLS_ORDR(SLS_ORDR_ID)
go


/* 
 * TABLE: SLS_TAX_RATE 
 */

ALTER TABLE SLS_TAX_RATE ADD CONSTRAINT RefZP_CDE42 
    FOREIGN KEY (ZP_CDE_ID)
    REFERENCES ZP_CDE(ZP_CDE_ID)
go


/* 
 * TABLE: TXBL_PRDCT 
 */

ALTER TABLE TXBL_PRDCT ADD CONSTRAINT RefPRDCT_CNFIG2 
    FOREIGN KEY (PRDCT_CNFIG_ID)
    REFERENCES PRDCT_CNFIG(PRDCT_CNFIG_ID)
go

ALTER TABLE TXBL_PRDCT ADD CONSTRAINT RefTXBL_STATE6 
    FOREIGN KEY (TXBL_STATE_ID)
    REFERENCES TXBL_STATE(TXBL_STATE_ID)
go


/* 
 * TABLE: ZP_CDE 
 */

ALTER TABLE ZP_CDE ADD CONSTRAINT RefTXBL_STATE33 
    FOREIGN KEY (TXBL_STATE_ID)
    REFERENCES TXBL_STATE(TXBL_STATE_ID)
go


