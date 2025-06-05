/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Model5.DM1
 *
 * Date Created : Thursday, June 05, 2025 16:32:35
 * Target DBMS : Microsoft SQL Server 2022
 */

/* 
 * TABLE: ATTORNEYS 
 */

CREATE TABLE ATTORNEYS(
    ATTORNEYID    int              IDENTITY(1,1),
    FIRSTNAME     nvarchar(100)    NULL,
    LASTNAME      nvarchar(100)    NULL,
    FIRMNAME      nvarchar(255)    NULL,
    EMAIL         nvarchar(255)    NULL,
    PHONE         nvarchar(20)     NULL,
    CONSTRAINT PK_Attorney_4FF1205F0F5F766C PRIMARY KEY CLUSTERED (ATTORNEYID)
)

go


IF OBJECT_ID('ATTORNEYS') IS NOT NULL
    PRINT '<<< CREATED TABLE ATTORNEYS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ATTORNEYS >>>'
go

/* 
 * TABLE: CASEPARTICIPANTS 
 */

CREATE TABLE CASEPARTICIPANTS(
    PARTICIPANTID    int             IDENTITY(1,1),
    CLASSACTIONID    int             NULL,
    CLIENTID         int             NULL,
    ATTORNEYID       int             NULL,
    ROLE             nvarchar(50)    NULL,
    CONSTRAINT PK_CasePart_7227997EBB8F043C PRIMARY KEY CLUSTERED (PARTICIPANTID)
)

go


IF OBJECT_ID('CASEPARTICIPANTS') IS NOT NULL
    PRINT '<<< CREATED TABLE CASEPARTICIPANTS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CASEPARTICIPANTS >>>'
go

/* 
 * TABLE: CLAIMS 
 */

CREATE TABLE CLAIMS(
    CLAIMID          int               IDENTITY(1,1),
    CLIENTID         int               NULL,
    CLASSACTIONID    int               NULL,
    CLAIMDATE        date              NULL,
    CLAIMSTATUS      nvarchar(50)      NULL,
    CLAIMAMOUNT      decimal(18, 2)    NULL,
    NOTES            text              NULL,
    CONSTRAINT PK_Claims_EF2E13BB866506A4 PRIMARY KEY CLUSTERED (CLAIMID)
)

go


IF OBJECT_ID('CLAIMS') IS NOT NULL
    PRINT '<<< CREATED TABLE CLAIMS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CLAIMS >>>'
go

/* 
 * TABLE: Claims2 
 */

CREATE TABLE Claims2(
    CLAIMID    nvarchar(18)    NOT NULL
)

go


IF OBJECT_ID('Claims2') IS NOT NULL
    PRINT '<<< CREATED TABLE Claims2 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Claims2 >>>'
go

/* 
 * TABLE: CLASSACTIONS 
 */

CREATE TABLE CLASSACTIONS(
    CLASSACTIONID    int              IDENTITY(1,1),
    TITLE            nvarchar(255)    NULL,
    DESCRIPTION      text             NULL,
    FILINGDATE       date             NULL,
    STATUS           nvarchar(50)     NULL,
    COURT            nvarchar(255)    NULL,
    COUNTY           nvarchar(50)     NOT NULL,
    CONSTRAINT PK_ClassAct_A9DFB9A33E6B3D16 PRIMARY KEY CLUSTERED (CLASSACTIONID)
)

go


IF OBJECT_ID('CLASSACTIONS') IS NOT NULL
    PRINT '<<< CREATED TABLE CLASSACTIONS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CLASSACTIONS >>>'
go

/* 
 * TABLE: CLIENTS 
 */

CREATE TABLE CLIENTS(
    CLIENTID     int              IDENTITY(1,1),
    FIRSTNAME    nvarchar(100)    NULL,
    LASTNAME     nvarchar(100)    NULL,
    EMAIL        nvarchar(255)    NULL,
    PHONE        nvarchar(20)     NULL,
    ADDRESS      nvarchar(255)    NULL,
    CITY         nvarchar(100)    NULL,
    STATE        nvarchar(50)     NULL,
    ZIPCODE      nvarchar(20)     NULL,
    CREATEDAT    datetime         CONSTRAINT [DF__Clients__Created__37A5467C] DEFAULT (getdate()) NULL,
    CONSTRAINT PK_Clients_E67E1A04A07AD257 PRIMARY KEY CLUSTERED (CLIENTID)
)

go


IF OBJECT_ID('CLIENTS') IS NOT NULL
    PRINT '<<< CREATED TABLE CLIENTS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CLIENTS >>>'
go

/* 
 * TABLE: DOCUMENTS 
 */

CREATE TABLE DOCUMENTS(
    DOCUMENTID    int              IDENTITY(1,1),
    RELATEDTO     nvarchar(50)     NULL,
    RELATEDID     int              NULL,
    FILENAME      nvarchar(255)    NULL,
    FILETYPE      nvarchar(50)     NULL,
    UPLOADEDAT    datetime         CONSTRAINT [DF__Documents__Uploa__4F7CD00D] DEFAULT (getdate()) NULL,
    CONSTRAINT PK_Document_1ABEEF6F1F495BDE PRIMARY KEY CLUSTERED (DOCUMENTID)
)

go


IF OBJECT_ID('DOCUMENTS') IS NOT NULL
    PRINT '<<< CREATED TABLE DOCUMENTS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DOCUMENTS >>>'
go

/* 
 * TABLE: NOTICES 
 */

CREATE TABLE NOTICES(
    NOTICEID          int              IDENTITY(1,1),
    CLASSACTIONID     int              NULL,
    NOTICEDATE        date             NULL,
    NOTICETYPE        nvarchar(100)    NULL,
    DELIVERYMETHOD    nvarchar(50)     NULL,
    CONTENT           text             NULL,
    CONSTRAINT PK_Notices_CE83CB85BF496C83 PRIMARY KEY CLUSTERED (NOTICEID)
)

go


IF OBJECT_ID('NOTICES') IS NOT NULL
    PRINT '<<< CREATED TABLE NOTICES >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE NOTICES >>>'
go

/* 
 * TABLE: PAYMENTS 
 */

CREATE TABLE PAYMENTS(
    PAYMENTID        int               IDENTITY(1,1),
    CLAIMID          int               NULL,
    PAYMENTDATE      date              NULL,
    AMOUNT           decimal(18, 2)    NULL,
    PAYMENTMETHOD    nvarchar(50)      NULL,
    STATUS           nvarchar(50)      NULL,
    CONSTRAINT PK_Payments_9B556A5891CED0F3 PRIMARY KEY CLUSTERED (PAYMENTID)
)

go


IF OBJECT_ID('PAYMENTS') IS NOT NULL
    PRINT '<<< CREATED TABLE PAYMENTS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PAYMENTS >>>'
go

/* 
 * TABLE: SETTLEMENTS 
 */

CREATE TABLE SETTLEMENTS(
    SETTLEMENTID      int               IDENTITY(1,1),
    CLASSACTIONID     int               NULL,
    SETTLEMENTDATE    date              NULL,
    TOTALAMOUNT       decimal(18, 2)    NULL,
    DESCRIPTION       text              NULL,
    CONSTRAINT PK_Settleme_771254BAD3EC1A66 PRIMARY KEY CLUSTERED (SETTLEMENTID)
)

go


IF OBJECT_ID('SETTLEMENTS') IS NOT NULL
    PRINT '<<< CREATED TABLE SETTLEMENTS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SETTLEMENTS >>>'
go

