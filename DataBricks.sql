/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      EnergyAIDemo.DM1
 *
 * Date Created : Friday, June 20, 2025 13:44:20
 * Target DBMS : Databricks
 */

/* 
 * TABLE: ADDRESS 
 */

CREATE TABLE ADDRESS
(
    ADDRESS_ID     int                 NOT NULL,
    STREET         string              NOT NULL,
    CITY           string              NOT NULL,
    STATE          string              NOT NULL,
    POSTAL_CODE    string              NOT NULL,
    COUNTRY        string              NOT NULL,
    LATITUDE       decimal(10, 6),
    LONGITUDE      decimal(10, 6),
    CUSTOMER_ID    int                 NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (ADDRESS_ID) 
)
;

/* 
 * TABLE: BILL 
 */

CREATE TABLE BILL
(
    BILL_ID                 int                 NOT NULL,
    BILL_DATE               date                NOT NULL,
    DUE_DATE                date                NOT NULL,
    TOTAL_AMOUNT            decimal(10, 2)      NOT NULL,
    STATUS                  string              NOT NULL,
    BILLING_PERIOD_START    date                NOT NULL,
    BILLING_PERIOD_END      date                NOT NULL,
    CUSTOMER_ID             int                 NOT NULL,
    TARIFF_ID               int                 NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (BILL_ID) 
)
;

/* 
 * TABLE: CONTACT 
 */

CREATE TABLE CONTACT
(
    CONTACT_ID      int         NOT NULL,
    PHONE_NUMBER    string,
    EMAIL           string,
    CONTACT_TYPE    string      NOT NULL,
    CUSTOMER_ID     int,
    CONSTRAINT PK16 PRIMARY KEY (CONTACT_ID) 
)
;

/* 
 * TABLE: CUSTOMER 
 */

CREATE TABLE CUSTOMER
(
    CUSTOMER_ID      int         NOT NULL,
    FIRST_NAME       string      NOT NULL,
    LAST_NAME        string      NOT NULL,
    DATE_OF_BIRTH    date,
    CUSTOMER_TYPE    string      NOT NULL,
    STATUS           string      NOT NULL,
    REGION_ID        int         NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (CUSTOMER_ID) 
)
;

/* 
 * TABLE: DIM_COMMISSION_PAYMENT 
 */

CREATE TABLE DIM_COMMISSION_PAYMENT
(
    COMMISSION_PAYMENT_ID          string       NOT NULL,
    ORDERNUMBER                    string       NOT NULL,
    ORDERDATE                      date,
    COMMISSIONPAYMENTVALUE         int,
    CUSTOMERPURCHASEORDERNUMBER    string,
    PAID                           boolean,
    CUSTOMERREFERENCENUMBER        string       NOT NULL,
    PAYMENTDATE                    date,
    CONSTRAINT PK26_1 PRIMARY KEY (COMMISSION_PAYMENT_ID) 
)
;

/* 
 * TABLE: EMPLOYEE 
 */

CREATE TABLE EMPLOYEE
(
    FIRST_NAME         string      NOT NULL,
    Demo               string,
    LAST_NAME          string      NOT NULL,
    EMPLOYEE_NUMBER    string      NOT NULL,
    POSITION           string      NOT NULL,
    HIRE_DATE          date        NOT NULL,
    STATUS             string      NOT NULL
)
USING DELTA
PARTITIONED BY (FIRST_NAME)
CLUSTER BY (LAST_NAME)
;

/* 
 * TABLE: METER 
 */

CREATE TABLE METER
(
    METER_ID             int         NOT NULL,
    SERIAL_NUMBER        string      NOT NULL,
    INSTALLATION_DATE    date        NOT NULL,
    STATUS               string      NOT NULL,
    METER_TYPE           string      NOT NULL,
    CUSTOMER_ID          int         NOT NULL,
    ADDRESS_ID           int         NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (METER_ID) 
)
;

/* 
 * TABLE: METER_READING 
 */

CREATE TABLE METER_READING
(
    READING_ID       int                 NOT NULL,
    METER_ID         int                 NOT NULL,
    READING_DATE     date                NOT NULL,
    READING_VALUE    decimal(12, 3)      NOT NULL,
    READING_TYPE     string              NOT NULL,
    USAGE_ID         int                 NOT NULL,
    BILL_ID          int                 NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (READING_ID, METER_ID) 
)
;

/* 
 * TABLE: OUTAGE 
 */

CREATE TABLE OUTAGE
(
    OUTAGE_ID             int            NOT NULL,
    START_TIME            timestamp      NOT NULL,
    END_TIME              timestamp,
    CAUSE                 string,
    AFFECTED_CUSTOMERS    int,
    STATUS                string         NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (OUTAGE_ID) 
)
;

/* 
 * TABLE: PAYMENT 
 */

CREATE TABLE PAYMENT
(
    PAYMENT_ID          int                 NOT NULL,
    PAYMENT_DATE        date                NOT NULL,
    AMOUNT              decimal(10, 2)      NOT NULL,
    PAYMENT_METHOD      string              NOT NULL,
    REFERENCE_NUMBER    string,
    BILL_ID             int,
    CONSTRAINT PK6 PRIMARY KEY (PAYMENT_ID) 
)
;

/* 
 * TABLE: POWER_LINE 
 */

CREATE TABLE POWER_LINE
(
    POWER_LINE_ID     int                 NOT NULL,
    LINE_NAME         string              NOT NULL,
    VOLTAGE_KV        decimal(8, 2)       NOT NULL,
    LENGTH_KM         decimal(10, 2)      NOT NULL,
    STATUS            string              NOT NULL,
    TRANSFORMER_ID    int                 NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (POWER_LINE_ID) 
)
;

/* 
 * TABLE: REGION 
 */

CREATE TABLE REGION
(
    REGION_ID      int         NOT NULL,
    REGION_NAME    string      NOT NULL,
    DESCRIPTION    string,
    OUTAGE_ID      int         NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (REGION_ID) 
)
;

/* 
 * TABLE: SERVICE_REQUEST 
 */

CREATE TABLE SERVICE_REQUEST
(
    REQUEST_ID      int         NOT NULL,
    REQUEST_DATE    date        NOT NULL,
    REQUEST_TYPE    string      NOT NULL,
    STATUS          string      NOT NULL,
    DESCRIPTION     string,
    CUSTOMER_ID     int         NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (REQUEST_ID) 
)
;

/* 
 * TABLE: SUBSTATION 
 */

CREATE TABLE SUBSTATION
(
    SUBSTATION_ID    int                 NOT NULL,
    NAME             string              NOT NULL,
    CAPACITY_MW      decimal(10, 2)      NOT NULL,
    STATUS           string              NOT NULL,
    OUTAGE_ID        int,
    REGION_ID        int                 NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (SUBSTATION_ID) 
)
;

/* 
 * TABLE: TARIFF 
 */

CREATE TABLE TARIFF
(
    TARIFF_ID       int                 NOT NULL,
    TARIFF_NAME     string              NOT NULL,
    DESCRIPTION     string,
    RATE_PER_KWH    decimal(8, 4)       NOT NULL,
    FIXED_CHARGE    decimal(10, 2)      NOT NULL,
    TARIFF_TYPE     string              NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (TARIFF_ID) 
)
;

/* 
 * TABLE: TRANSFORMER 
 */

CREATE TABLE TRANSFORMER
(
    TRANSFORMER_ID       int                 NOT NULL,
    SERIAL_NUMBER        string              NOT NULL,
    CAPACITY_KVA         decimal(10, 2)      NOT NULL,
    INSTALLATION_DATE    date                NOT NULL,
    STATUS               string              NOT NULL,
    OUTAGE_ID            int,
    SUBSTATION_ID        int                 NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (TRANSFORMER_ID) 
)
;

/* 
 * TABLE: USAGE 
 */

CREATE TABLE USAGE
(
    USAGE_ID       int                 NOT NULL,
    BILL_ID        int                 NOT NULL,
    START_DATE     date                NOT NULL,
    END_DATE       date                NOT NULL,
    KWH_USED       decimal(12, 3)      NOT NULL,
    PEAK_DEMAND    decimal(10, 3),
    CONSTRAINT PK8 PRIMARY KEY (USAGE_ID, BILL_ID) 
)
;

