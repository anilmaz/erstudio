/*
 * ER/Studio Data Architect SQL Code Generation
 * Company :      IDERA
 * Project :      Publications
 * Author :       Product Management
 *
 * Date Created : Tuesday, February 25, 2025 13:54:20
 * Target DBMS : Microsoft SQL Server 2017
 */

CREATE TYPE empid FROM char(9) NULL
go

CREATE TYPE id FROM varchar(11) NULL
go

CREATE TYPE tid FROM varchar(6) NULL
go

/* 
 * TABLE: authors 
 */

CREATE TABLE authors(
    au_id       id             NOT NULL
                CONSTRAINT CK__authors__au_id__02DC7882 CHECK ((au_id like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]')),
    au_lname    varchar(40)    NOT NULL,
    au_fname    varchar(20)    NOT NULL,
    phone       char(12)       DEFAULT ('UNKNOWN') NOT NULL,
    address     varchar(40)    NULL,
    city        varchar(20)    NULL,
    state       char(2)        NULL,
    zip         char(5)        NULL
                CONSTRAINT CK__authors__zip__04C4C0F4 CHECK ((zip like '[0-9][0-9][0-9][0-9][0-9]')),
    contract    bit            NOT NULL,
    CONSTRAINT UPKCL_auidind PRIMARY KEY CLUSTERED (au_id)
)

go


IF OBJECT_ID('authors') IS NOT NULL
    PRINT '<<< CREATED TABLE authors >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE authors >>>'
go

/* 
 * TABLE: discounts 
 */

CREATE TABLE discounts(
    discounttype    varchar(40)      NOT NULL,
    stor_id         char(4)          NULL,
    lowqty          smallint         NULL,
    highqty         smallint         NULL,
    discount        decimal(4, 2)    NOT NULL
)

go


IF OBJECT_ID('discounts') IS NOT NULL
    PRINT '<<< CREATED TABLE discounts >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE discounts >>>'
go

/* 
 * TABLE: employee 
 */

CREATE TABLE employee(
    emp_id       empid          NOT NULL,
    fname        varchar(20)    NOT NULL,
    minit        char(1)        NULL,
    lname        varchar(30)    NOT NULL,
    job_id       smallint       DEFAULT 1 NOT NULL,
    job_lvl      tinyint        DEFAULT 10 NOT NULL,
    pub_id       char(4)        DEFAULT ('9952') NOT NULL,
    hire_date    datetime       DEFAULT (getdate()) NOT NULL,
    CONSTRAINT PK_emp_id PRIMARY KEY NONCLUSTERED (emp_id)
)

go


IF OBJECT_ID('employee') IS NOT NULL
    PRINT '<<< CREATED TABLE employee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE employee >>>'
go

/* 
 * TABLE: jobs 
 */

CREATE TABLE jobs(
    job_id      smallint       IDENTITY(1,1),
    job_desc    varchar(50)    DEFAULT ('New Position - title not formalized yet') NOT NULL,
    min_lvl     tinyint        NOT NULL
                CONSTRAINT CK__jobs__min_lvl__2625B4BF CHECK (min_lvl >= 10),
    max_lvl     tinyint        NOT NULL
                CONSTRAINT CK__jobs__max_lvl__2719D8F8 CHECK (max_lvl <= 250),
    CONSTRAINT PK__jobs__job_id__243D6C4D PRIMARY KEY CLUSTERED (job_id)
)

go


IF OBJECT_ID('jobs') IS NOT NULL
    PRINT '<<< CREATED TABLE jobs >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE jobs >>>'
go

/* 
 * TABLE: pub_info 
 */

CREATE TABLE pub_info(
    pub_id     char(4)    NOT NULL,
    logo       image      NULL,
    pr_info    text       NULL,
    CONSTRAINT UPKCL_pubinfo PRIMARY KEY CLUSTERED (pub_id)
)

go


IF OBJECT_ID('pub_info') IS NOT NULL
    PRINT '<<< CREATED TABLE pub_info >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pub_info >>>'
go

/* 
 * TABLE: publishers 
 */

CREATE TABLE publishers(
    pub_id      char(4)        NOT NULL
                CONSTRAINT CK__publisher__pub_i__089551D8 CHECK (pub_id = '1756' or (pub_id = '1622' or (pub_id = '0877' or (pub_id = '0736' or (pub_id = '1389')))) or (pub_id like '99[0-9][0-9]')),
    pub_name    varchar(40)    NULL,
    city        varchar(20)    NULL,
    state       char(2)        NULL,
    country     varchar(30)    DEFAULT ('USA') NULL,
    CONSTRAINT UPKCL_pubind PRIMARY KEY CLUSTERED (pub_id)
)

go


IF OBJECT_ID('publishers') IS NOT NULL
    PRINT '<<< CREATED TABLE publishers >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE publishers >>>'
go

/* 
 * TABLE: roysched 
 */

CREATE TABLE roysched(
    title_id    tid    NOT NULL,
    lorange     int    NULL,
    hirange     int    NULL,
    royalty     int    NULL
)

go


IF OBJECT_ID('roysched') IS NOT NULL
    PRINT '<<< CREATED TABLE roysched >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE roysched >>>'
go

/* 
 * TABLE: sales 
 */

CREATE TABLE sales(
    stor_id     char(4)        NOT NULL,
    ord_num     varchar(20)    NOT NULL,
    title_id    tid            NOT NULL,
    ord_date    datetime       NOT NULL,
    qty         smallint       NOT NULL,
    payterms    varchar(12)    NOT NULL,
    CONSTRAINT UPKCL_sales PRIMARY KEY CLUSTERED (stor_id, ord_num, title_id)
)

go


IF OBJECT_ID('sales') IS NOT NULL
    PRINT '<<< CREATED TABLE sales >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sales >>>'
go

/* 
 * TABLE: stores 
 */

CREATE TABLE stores(
    stor_id         char(4)        NOT NULL,
    stor_name       varchar(40)    NULL,
    stor_address    varchar(40)    NULL,
    city            varchar(20)    NULL,
    state           char(2)        NULL,
    zip             char(5)        NULL,
    CONSTRAINT UPK_storeid PRIMARY KEY CLUSTERED (stor_id)
)

go


IF OBJECT_ID('stores') IS NOT NULL
    PRINT '<<< CREATED TABLE stores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE stores >>>'
go

/* 
 * TABLE: titleauthor 
 */

CREATE TABLE titleauthor(
    au_id         id         NOT NULL,
    title_id      tid        NOT NULL,
    au_ord        tinyint    NULL,
    royaltyper    int        NULL,
    CONSTRAINT UPKCL_taind PRIMARY KEY CLUSTERED (au_id, title_id)
)

go


IF OBJECT_ID('titleauthor') IS NOT NULL
    PRINT '<<< CREATED TABLE titleauthor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE titleauthor >>>'
go

/* 
 * TABLE: titles 
 */

CREATE TABLE titles(
    title_id     tid             NOT NULL,
    title        varchar(80)     NOT NULL,
    type         char(12)        DEFAULT ('UNDECIDED') NOT NULL,
    pub_id       char(4)         NULL,
    price        money           NULL,
    advance      money           NULL,
    royalty      int             NULL,
    ytd_sales    int             NULL,
    notes        varchar(200)    NULL,
    pubdate      datetime        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT UPKCL_titleidind PRIMARY KEY CLUSTERED (title_id)
)

go


IF OBJECT_ID('titles') IS NOT NULL
    PRINT '<<< CREATED TABLE titles >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE titles >>>'
go

/* 
 * INDEX: aunmind 
 */

CREATE INDEX aunmind ON authors(au_lname, au_fname)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('authors') AND name='aunmind')
    PRINT '<<< CREATED INDEX authors.aunmind >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX authors.aunmind >>>'
go

/* 
 * INDEX: employee_ind 
 */

CREATE CLUSTERED INDEX employee_ind ON employee(lname, fname, minit)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('employee') AND name='employee_ind')
    PRINT '<<< CREATED INDEX employee.employee_ind >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX employee.employee_ind >>>'
go

/* 
 * INDEX: titleidind 
 */

CREATE INDEX titleidind ON roysched(title_id)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('roysched') AND name='titleidind')
    PRINT '<<< CREATED INDEX roysched.titleidind >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX roysched.titleidind >>>'
go

/* 
 * INDEX: titleidind 
 */

CREATE INDEX titleidind ON sales(title_id)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sales') AND name='titleidind')
    PRINT '<<< CREATED INDEX sales.titleidind >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sales.titleidind >>>'
go

/* 
 * INDEX: auidind 
 */

CREATE INDEX auidind ON titleauthor(au_id)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('titleauthor') AND name='auidind')
    PRINT '<<< CREATED INDEX titleauthor.auidind >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX titleauthor.auidind >>>'
go

/* 
 * INDEX: titleidind 
 */

CREATE INDEX titleidind ON titleauthor(title_id)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('titleauthor') AND name='titleidind')
    PRINT '<<< CREATED INDEX titleauthor.titleidind >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX titleauthor.titleidind >>>'
go

/* 
 * INDEX: titleind 
 */

CREATE INDEX titleind ON titles(title)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('titles') AND name='titleind')
    PRINT '<<< CREATED INDEX titles.titleind >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX titles.titleind >>>'
go

/* 
 * TABLE: discounts 
 */

ALTER TABLE discounts ADD CONSTRAINT FK__discounts__stor___2160FFA2 
    FOREIGN KEY (stor_id)
    REFERENCES stores(stor_id)
go


/* 
 * TABLE: employee 
 */

ALTER TABLE employee ADD CONSTRAINT FK__employee__job_id__30A34332 
    FOREIGN KEY (job_id)
    REFERENCES jobs(job_id)
go

ALTER TABLE employee ADD CONSTRAINT FK__employee__pub_id__337FAFDD 
    FOREIGN KEY (pub_id)
    REFERENCES publishers(pub_id)
go


/* 
 * TABLE: pub_info 
 */

ALTER TABLE pub_info ADD CONSTRAINT FK__pub_info__pub_id__2AEA69DC 
    FOREIGN KEY (pub_id)
    REFERENCES publishers(pub_id)
go


/* 
 * TABLE: roysched 
 */

ALTER TABLE roysched ADD CONSTRAINT FK__roysched__title___1E8492F7 
    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
go


/* 
 * TABLE: sales 
 */

ALTER TABLE sales ADD CONSTRAINT FK__sales__stor_id__1AB40213 
    FOREIGN KEY (stor_id)
    REFERENCES stores(stor_id)
go

ALTER TABLE sales ADD CONSTRAINT FK__sales__title_id__1BA8264C 
    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
go


/* 
 * TABLE: titleauthor 
 */

ALTER TABLE titleauthor ADD CONSTRAINT FK__titleauth__au_id__1312E04B 
    FOREIGN KEY (au_id)
    REFERENCES authors(au_id)
go

ALTER TABLE titleauthor ADD CONSTRAINT FK__titleauth__title__14070484 
    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
go


/* 
 * TABLE: titles 
 */

ALTER TABLE titles ADD CONSTRAINT FK__titles__pub_id__0E4E2B2E 
    FOREIGN KEY (pub_id)
    REFERENCES publishers(pub_id)
go


