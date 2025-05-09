--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      AWSDimensional.DM1
--
-- Date Created : Friday, May 09, 2025 12:05:51
-- Target DBMS : Amazon Redshift
--

-- 
-- TABLE: "CUSTOMER" 
--

CREATE TABLE "CUSTOMERS"(
    "CUSTOMERID"    boolean    NOT NULL,
    "CUSTOMERNAME"  boolean    NOT NULL,
    CONSTRAINT "PK1" PRIMARY KEY ("CUSTOMERID")
)
;



-- 
-- TABLE: "ORDERS" 
--

CREATE TABLE "ORDERS"(
    "CUSTOMERID"   boolean    NOT NULL,
    "ORDERID"      boolean    NOT NULL,
    "PRODUCTID"    boolean    NOT NULL,
    "PRODUCTTYPE"  boolean    NOT NULL,
    CONSTRAINT "PK2" PRIMARY KEY ("CUSTOMERID", "ORDERID")
)
;



-- 
-- TABLE: "PRODUCTS" 
--

CREATE TABLE "PRODUCTS"(
    "CUSTOMERID"   boolean     NOT NULL,
    "PRODUCTID"    boolean     NOT NULL,
    "ORDERID"      boolean     NOT NULL,
    "PRODUCTNAME"  char(10)    NOT NULL,
    "PRICE"        real        NOT NULL,
    CONSTRAINT "PK3" PRIMARY KEY ("CUSTOMERID", "PRODUCTID", "ORDERID")
)
;



