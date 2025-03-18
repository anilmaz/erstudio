/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Model7.DM1
 *
 * Date Created : Tuesday, March 18, 2025 10:01:21
 * Target DBMS : Microsoft Azure Synapse Analytics
 */

CREATE TYPE AccountNumber FROM nvarchar(15) NULL
go

CREATE TYPE Flag FROM bit NOT NULL
go

CREATE TYPE Name FROM nvarchar(50) NULL
go

CREATE TYPE NameStyle FROM bit NOT NULL
go

CREATE TYPE Phone FROM nvarchar(25) NULL
go

/* 
 * TABLE: Address 
 */

CREATE TABLE Address(
    AddressID          int                 IDENTITY(1,1) NOT FOR REPLICATION,
    AddressLine1       nvarchar(60)        NOT NULL,
    AddressLine2       nvarchar(60)        NULL,
    [Address Line 3]   nvarchar(60)        NULL,
    City               nvarchar(30)        NOT NULL,
    StateProvinceID    int                 NOT NULL,
    PostalCode         nvarchar(15)        NOT NULL,
    rowguid            uniqueidentifier    CONSTRAINT [DF_Address_rowguid] DEFAULT (newid()) NOT NULL,
    ModifiedDate       datetime            CONSTRAINT [DF_Address_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_Address_AddressID PRIMARY KEY NONCLUSTERED (AddressID) NOT ENFORCED
)

go


IF OBJECT_ID('Address') IS NOT NULL
    PRINT '<<< CREATED TABLE Address >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Address >>>'
go

/* 
 * TABLE: Contact 
 */

CREATE TABLE Contact(
    ContactID                int                 IDENTITY(1,1) NOT FOR REPLICATION,
    NameStyle                NameStyle           DEFAULT ((0)) NOT NULL,
    Title                    nvarchar(8)         NULL,
    FirstName                Name                NOT NULL,
    MiddleName               Name                NULL,
    LastName                 Name                NOT NULL,
    Suffix                   nvarchar(10)        NULL,
    EmailAddress             nvarchar(50)        NULL,
    EmailPromotion           int                 CONSTRAINT [DF_Contact_EmailPromotion] DEFAULT (0) NOT NULL
                             CONSTRAINT CK_Contact_EmailPromotion CHECK (([EmailPromotion]>=(0) AND [EmailPromotion]<=(2))),
    Phone                    Phone               NULL,
    PasswordHash             varchar(40)         NOT NULL,
    PasswordSalt             varchar(10)         NOT NULL,
    AdditionalContactInfo    varchar(18)         NULL,
    rowguid                  uniqueidentifier    CONSTRAINT [DF_Contact_rowguid] DEFAULT (newid()) NOT NULL,
    ModifiedDate             datetime            CONSTRAINT [DF_Contact_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_Contact_ContactID PRIMARY KEY NONCLUSTERED (ContactID) NOT ENFORCED
)

go


IF OBJECT_ID('Contact') IS NOT NULL
    PRINT '<<< CREATED TABLE Contact >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Contact >>>'
go

/* 
 * TABLE: ContactType 
 */

CREATE TABLE ContactType(
    ContactTypeID    int         IDENTITY(1,1),
    Name             Name        NOT NULL,
    ModifiedDate     datetime    CONSTRAINT [DF_ContactType_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_ContactType_ContactTypeID PRIMARY KEY NONCLUSTERED (ContactTypeID) NOT ENFORCED
)

go


IF OBJECT_ID('ContactType') IS NOT NULL
    PRINT '<<< CREATED TABLE ContactType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ContactType >>>'
go

/* 
 * TABLE: CountryRegion 
 */

CREATE TABLE CountryRegion(
    CountryRegionCode    nvarchar(3)    NOT NULL,
    Name                 Name           NOT NULL,
    ModifiedDate         datetime       CONSTRAINT [DF_CountryRegion_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_CountryRegion_CountryRegionCode PRIMARY KEY NONCLUSTERED (CountryRegionCode) NOT ENFORCED
)

go


IF OBJECT_ID('CountryRegion') IS NOT NULL
    PRINT '<<< CREATED TABLE CountryRegion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CountryRegion >>>'
go

/* 
 * TABLE: Culture 
 */

CREATE TABLE Culture(
    Name            Name        NOT NULL,
    ModifiedDate    datetime    DEFAULT (getdate()) NOT NULL
)

go


IF OBJECT_ID('Culture') IS NOT NULL
    PRINT '<<< CREATED TABLE Culture >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Culture >>>'
go

/* 
 * TABLE: Document 
 */

CREATE TABLE Document(
    Title           nvarchar(50)     NOT NULL,
    FileName        nvarchar(400)    NOT NULL,
    ChangeNumber    int              DEFAULT (0) NOT NULL
)

go


IF OBJECT_ID('Document') IS NOT NULL
    PRINT '<<< CREATED TABLE Document >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Document >>>'
go

/* 
 * TABLE: Illustration 
 */

CREATE TABLE Illustration(
    IllustrationID    int            IDENTITY(1,1),
    Diagram           varchar(18)    NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (IllustrationID) NOT ENFORCED
)

go


IF OBJECT_ID('Illustration') IS NOT NULL
    PRINT '<<< CREATED TABLE Illustration >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Illustration >>>'
go

/* 
 * TABLE: ShipMethod 
 */

CREATE TABLE ShipMethod(
    ShipMethodID    int                 IDENTITY(1,1),
    Name            Name                NOT NULL,
    ShipBase        money               CONSTRAINT [DF_ShipMethod_ShipBase] DEFAULT ((0.00)) NOT NULL
                    CONSTRAINT CK_ShipMethod_ShipBase CHECK (([ShipBase]>(0.00))),
    ShipRate        money               CONSTRAINT [DF_ShipMethod_ShipRate] DEFAULT ((0.00)) NOT NULL
                    CONSTRAINT CK_ShipMethod_ShipRate CHECK (([ShipRate]>(0.00))),
    rowguid         uniqueidentifier    CONSTRAINT [DF_ShipMethod_rowguid] DEFAULT (newid()) NOT NULL,
    ModifiedDate    datetime            CONSTRAINT [DF_ShipMethod_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_ShipMethod_ShipMethodID PRIMARY KEY NONCLUSTERED (ShipMethodID) NOT ENFORCED
)

go


IF OBJECT_ID('ShipMethod') IS NOT NULL
    PRINT '<<< CREATED TABLE ShipMethod >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ShipMethod >>>'
go

/* 
 * TABLE: StateProvince 
 */

CREATE TABLE StateProvince(
    StateProvinceID            int                 IDENTITY(1,1),
    StateProvinceCode          nchar(3)            NOT NULL,
    CountryRegionCode          nvarchar(3)         NOT NULL,
    IsOnlyStateProvinceFlag    Flag                DEFAULT ((1)) NOT NULL,
    Name                       Name                NOT NULL,
    TerritoryID                int                 NOT NULL,
    rowguid                    uniqueidentifier    CONSTRAINT [DF_StateProvince_rowguid] DEFAULT (newid()) NOT NULL,
    ModifiedDate               datetime            CONSTRAINT [DF_StateProvince_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_StateProvince_StateProvinceID PRIMARY KEY NONCLUSTERED (StateProvinceID) NOT ENFORCED
)

go


IF OBJECT_ID('StateProvince') IS NOT NULL
    PRINT '<<< CREATED TABLE StateProvince >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE StateProvince >>>'
go

/* 
 * TABLE: Vendor 
 */

CREATE TABLE Vendor(
    VendorID                   int               IDENTITY(1,1),
    AccountNumber              AccountNumber     NOT NULL,
    Name                       Name              NOT NULL,
    CreditRating               tinyint           NOT NULL
                               CONSTRAINT CK_Vendor_CreditRating CHECK (([CreditRating]>=(1) AND [CreditRating]<=(5))),
    PreferredVendorStatus      Flag              DEFAULT ((1)) NOT NULL,
    ActiveFlag                 Flag              DEFAULT ((1)) NOT NULL,
    PurchasingWebServiceURL    nvarchar(1024)    NULL,
    ModifiedDate               datetime          CONSTRAINT [DF_Vendor_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_Vendor_VendorID PRIMARY KEY NONCLUSTERED (VendorID) NOT ENFORCED
)

go


IF OBJECT_ID('Vendor') IS NOT NULL
    PRINT '<<< CREATED TABLE Vendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Vendor >>>'
go

/* 
 * TABLE: VendorAddress 
 */

CREATE TABLE VendorAddress(
    VendorID         int         NOT NULL,
    AddressID        int         NOT NULL,
    AddressTypeID    int         NOT NULL,
    ModifiedDate     datetime    CONSTRAINT [DF_VendorAddress_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_VendorAddress_VendorID_AddressID PRIMARY KEY NONCLUSTERED (VendorID, AddressID) NOT ENFORCED
)

go


IF OBJECT_ID('VendorAddress') IS NOT NULL
    PRINT '<<< CREATED TABLE VendorAddress >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE VendorAddress >>>'
go

/* 
 * TABLE: VendorContact 
 */

CREATE TABLE VendorContact(
    VendorID         int         NOT NULL,
    ContactID        int         NOT NULL,
    ContactTypeID    int         NOT NULL,
    ModifiedDate     datetime    CONSTRAINT [DF_VendorContact_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_VendorContact_VendorID_ContactID PRIMARY KEY NONCLUSTERED (VendorID, ContactID) NOT ENFORCED
)

go


IF OBJECT_ID('VendorContact') IS NOT NULL
    PRINT '<<< CREATED TABLE VendorContact >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE VendorContact >>>'
go

