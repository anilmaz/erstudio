--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      NewRepoModel.DM1
--
-- Date Created : Thursday, February 06, 2025 12:18:23
-- Target DBMS : PostgreSQL 13.x-16.x
--

-- 
-- TABLE: "CommissionPayment" 
--

CREATE TABLE "CommissionPayment"(
    "CommissionPaymentValue"  integer,
    "Paid"                    boolean,
    "PaymentDate"             date
)
;



-- 
-- TABLE: "Employee" 
--

CREATE TABLE "Employee"(
    "EmployeeNumber"  varchar(12)      NOT NULL,
    "EmployeeType"    character        NOT NULL,
    "StartDate"       date,
    "PhoneNumber"     numeric(9, 0),
    "FirstName"       varchar(200)     NOT NULL,
    "Surname"         varchar(200)     NOT NULL,
    "Member"          character(10)    NOT NULL,
    "Manager"         character(10),
    "AddressId"       integer          NOT NULL
)
;



-- 
-- TABLE: "Order" 
--

CREATE TABLE "Order"(
    "OrderNumber"                  character(10)    NOT NULL,
    "OrderDate"                    date,
    "CustomerPurchaseOrderNumber"  varchar(18),
    "CustomerReferenceNumber"      character(10)    NOT NULL
)
;



