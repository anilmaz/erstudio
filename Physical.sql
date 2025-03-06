/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Demo123.DM1
 *
 * Date Created : Thursday, March 06, 2025 13:35:33
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Categories 
 */

CREATE TABLE Categories(
    CategoryID      int             IDENTITY(1,1),
    CategoryName    nvarchar(50)    NOT NULL,
    CONSTRAINT PK__Categori__19093A2B121F5C39 PRIMARY KEY CLUSTERED (CategoryID)
)

go


IF OBJECT_ID('Categories') IS NOT NULL
    PRINT '<<< CREATED TABLE Categories >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Categories >>>'
go

/* 
 * TABLE: Customers 
 */

CREATE TABLE Customers(
    CustomerID      int              IDENTITY(1,1),
    CustomerName    nvarchar(100)    NOT NULL,
    Email           nvarchar(100)    NOT NULL,
    Phone           nvarchar(20)     NOT NULL,
    CONSTRAINT PK__Customer__A4AE64B854D36DE8 PRIMARY KEY CLUSTERED (CustomerID)
)

go


IF OBJECT_ID('Customers') IS NOT NULL
    PRINT '<<< CREATED TABLE Customers >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Customers >>>'
go

/* 
 * TABLE: OrderDetails 
 */

CREATE TABLE OrderDetails(
    OrderDetailID    int               IDENTITY(1,1),
    OrderID          int               NULL,
    ProductID        int               NULL,
    Quantity         int               NOT NULL,
    UnitPrice        decimal(10, 2)    NOT NULL,
    CONSTRAINT PK__OrderDet__D3B9D30C4175AC87 PRIMARY KEY CLUSTERED (OrderDetailID)
)

go


IF OBJECT_ID('OrderDetails') IS NOT NULL
    PRINT '<<< CREATED TABLE OrderDetails >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE OrderDetails >>>'
go

/* 
 * TABLE: Orders 
 */

CREATE TABLE Orders(
    OrderID        int               IDENTITY(1,1),
    CustomerID     int               NULL,
    OrderDate      datetime          NOT NULL,
    TotalAmount    decimal(10, 2)    NOT NULL,
    CONSTRAINT PK__Orders__C3905BAFD46203FE PRIMARY KEY CLUSTERED (OrderID)
)

go


IF OBJECT_ID('Orders') IS NOT NULL
    PRINT '<<< CREATED TABLE Orders >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Orders >>>'
go

/* 
 * TABLE: Products 
 */

CREATE TABLE Products(
    ProductID        int               IDENTITY(1,1),
    ProductName      nvarchar(100)     NOT NULL,
    CategoryID       int               NULL,
    Price            decimal(10, 2)    NOT NULL,
    StockQuantity    int               NOT NULL,
    CONSTRAINT PK__Products__B40CC6ED0477DAAD PRIMARY KEY CLUSTERED (ProductID)
)

go


IF OBJECT_ID('Products') IS NOT NULL
    PRINT '<<< CREATED TABLE Products >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Products >>>'
go

/* 
 * TABLE: OrderDetails 
 */

ALTER TABLE OrderDetails ADD CONSTRAINT FK__OrderDeta__Order__412EB0B6 
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
go

ALTER TABLE OrderDetails ADD CONSTRAINT FK__OrderDeta__Produ__4222D4EF 
    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
go


/* 
 * TABLE: Orders 
 */

ALTER TABLE Orders ADD CONSTRAINT FK__Orders__Customer__3E52440B 
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
go


/* 
 * TABLE: Products 
 */

ALTER TABLE Products ADD CONSTRAINT FK__Products__Catego__398D8EEE 
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
go


