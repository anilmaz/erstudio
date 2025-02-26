/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Enterprise Lakehouse
 * Author :       Jamie Knowles
 *
 * Date Created : Wednesday, February 26, 2025 08:14:12
 * Target DBMS : Databricks
 */

/* 
 * TABLE: DIM_CommissionPayment_Junk 
 */

CREATE TABLE DIM_CommissionPayment_Junk
(
    CommissionPaymentJunk_ID    int      NOT NULL,
    CONSTRAINT PK48 PRIMARY KEY (CommissionPaymentJunk_ID) 
)
;

/* 
 * TABLE: DIM_CommissionPaymentTime 
 */

CREATE TABLE DIM_CommissionPaymentTime
(
    TimeID         int       NOT NULL,
    PaymentDate    date,
    CONSTRAINT PK47 PRIMARY KEY (TimeID) 
)
;

/* 
 * TABLE: DIM_Employee 
 */

CREATE TABLE DIM_Employee
(
    EmployeeNumber    string              NOT NULL,
    EmployeeType      string              NOT NULL,
    StartDate         date,
    PhoneNumber       decimal(15, 0),
    FirstName         string              NOT NULL,
    Surname           string              NOT NULL,
    Member            string              NOT NULL,
    Manager           string,
    AddressId         int                 NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (EmployeeNumber) 
)
;

/* 
 * TABLE: DIM_Order 
 */

CREATE TABLE DIM_Order
(
    OrderNumber                    string      NOT NULL,
    OrderDate                      date,
    CustomerPurchaseOrderNumber    string,
    SalesPerson                    string      NOT NULL,
    CustomerReferenceNumber        string      NOT NULL,
    CONSTRAINT PK22 PRIMARY KEY (OrderNumber) 
)
;

/* 
 * TABLE: FACT_CommissionPayment 
 */

CREATE TABLE FACT_CommissionPayment
(
    EmployeeNumber              string       NOT NULL,
    OrderNumber                 string       NOT NULL,
    TimeID                      int          NOT NULL,
    CommissionPaymentJunk_ID    int          NOT NULL,
    CommissionPaymentValue      int,
    Paid                        boolean,
    CONSTRAINT PK26 PRIMARY KEY (EmployeeNumber, OrderNumber, TimeID, CommissionPaymentJunk_ID) 
)
;

/* 
 * TABLE: FACT_CommissionPayment 
 */

ALTER TABLE FACT_CommissionPayment ADD CONSTRAINT RefDIM_Order11 
    FOREIGN KEY (OrderNumber)
    REFERENCES DIM_Order
;

ALTER TABLE FACT_CommissionPayment ADD CONSTRAINT RefDIM_Employee31 
    FOREIGN KEY (EmployeeNumber)
    REFERENCES DIM_Employee
;

ALTER TABLE FACT_CommissionPayment ADD CONSTRAINT RefDIM_CommissionPaymentTime61 
    FOREIGN KEY (TimeID)
    REFERENCES DIM_CommissionPaymentTime
;

ALTER TABLE FACT_CommissionPayment ADD CONSTRAINT RefDIM_CommissionPayment_Junk71 
    FOREIGN KEY (CommissionPaymentJunk_ID)
    REFERENCES DIM_CommissionPayment_Junk
;


