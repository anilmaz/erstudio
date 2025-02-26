/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Ecommerce.DM1
 *
 * Date Created : Wednesday, February 26, 2025 17:30:38
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: ADDRESS_TYPE 
 */

CREATE TABLE ADDRESS_TYPE(
    addr_type_cd      int             NOT NULL,
    addr_type_name    varchar(100)    NOT NULL,
    addr_type_desc    varchar(500)    NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (addr_type_cd)
)

go


IF OBJECT_ID('ADDRESS_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE ADDRESS_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ADDRESS_TYPE >>>'
go

/* 
 * TABLE: CREDIT_CARD 
 */

CREATE TABLE CREDIT_CARD(
    cc_id         int        NOT NULL,
    cust_id       int        NOT NULL,
    cc_type_cd    int        NOT NULL,
    cc_num        int        NOT NULL,
    cc_exp_mon    char(2)    NOT NULL,
    cc_exp_yr     char(4)    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (cc_id)
)

go


IF OBJECT_ID('CREDIT_CARD') IS NOT NULL
    PRINT '<<< CREATED TABLE CREDIT_CARD >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CREDIT_CARD >>>'
go

/* 
 * TABLE: CREDIT_CARD_TYPE 
 */

CREATE TABLE CREDIT_CARD_TYPE(
    cc_type_cd      int             NOT NULL,
    cc_type_name    varchar(100)    NOT NULL,
    cc_type_desc    varchar(500)    NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (cc_type_cd)
)

go


IF OBJECT_ID('CREDIT_CARD_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE CREDIT_CARD_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CREDIT_CARD_TYPE >>>'
go

/* 
 * TABLE: CURRENCY 
 */

CREATE TABLE CURRENCY(
    curr_id      int            NOT NULL,
    curr_name    varchar(50)    NOT NULL,
    curr_sym     char(1)        NOT NULL,
    CONSTRAINT PK20 PRIMARY KEY NONCLUSTERED (curr_id)
)

go


IF OBJECT_ID('CURRENCY') IS NOT NULL
    PRINT '<<< CREATED TABLE CURRENCY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CURRENCY >>>'
go

/* 
 * TABLE: CUSTOMER 
 */

CREATE TABLE CUSTOMER(
    cust_id             int             NOT NULL,
    cust_fname          varchar(100)    NOT NULL,
    cust_mid_initial    char(1)         NOT NULL,
    cust_lname          varchar(100)    NOT NULL,
    cust_email_addr     varchar(255)    NOT NULL,
    cust_password       varchar(16)     NOT NULL,
    cust_gend           char(1)         NOT NULL,
    cust_age            int             NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (cust_id)
)

go


IF OBJECT_ID('CUSTOMER') IS NOT NULL
    PRINT '<<< CREATED TABLE CUSTOMER >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CUSTOMER >>>'
go

/* 
 * TABLE: CUSTOMER_ADDRESS 
 */

CREATE TABLE CUSTOMER_ADDRESS(
    cust_addr_id       int             NOT NULL,
    cust_id            int             NOT NULL,
    addr_type_cd       int             NOT NULL,
    cust_addr_line1    varchar(100)    NOT NULL,
    cust_addr_line2    varchar(100)    NULL,
    cust_city          varchar(30)     NOT NULL,
    cust_state         char(2)         NOT NULL,
    cust_zip           char(5)         NOT NULL,
    cust_zip_ext       char(4)         NULL,
    is_prim_ship_to    char(1)         NOT NULL,
    is_prim_bill_to    char(1)         NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (cust_addr_id, cust_id)
)

go


IF OBJECT_ID('CUSTOMER_ADDRESS') IS NOT NULL
    PRINT '<<< CREATED TABLE CUSTOMER_ADDRESS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CUSTOMER_ADDRESS >>>'
go

/* 
 * TABLE: CUSTOMER_PHONE 
 */

CREATE TABLE CUSTOMER_PHONE(
    cust_phone_id     int         NOT NULL,
    cust_id           int         NOT NULL,
    phone_type_id     int         NOT NULL,
    cust_area_cd      char(5)     NULL,
    cust_phone        char(10)    NULL,
    cust_phone_ext    char(10)    NULL,
    CONSTRAINT PK18 PRIMARY KEY NONCLUSTERED (cust_phone_id, cust_id)
)

go


IF OBJECT_ID('CUSTOMER_PHONE') IS NOT NULL
    PRINT '<<< CREATED TABLE CUSTOMER_PHONE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CUSTOMER_PHONE >>>'
go

/* 
 * TABLE: INVENTORY_ITEM 
 */

CREATE TABLE INVENTORY_ITEM(
    invent_cd          int      NOT NULL,
    prod_id            int      NOT NULL,
    loc_id             int      NOT NULL,
    stock_qty          int      NOT NULL,
    stock_date         date     NOT NULL,
    next_stock_date    date     NULL,
    wholesale_price    float    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (invent_cd)
)

go


IF OBJECT_ID('INVENTORY_ITEM') IS NOT NULL
    PRINT '<<< CREATED TABLE INVENTORY_ITEM >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INVENTORY_ITEM >>>'
go

/* 
 * TABLE: INVENTORY_LOCATION 
 */

CREATE TABLE INVENTORY_LOCATION(
    loc_id            int             NOT NULL,
    loc_name          varchar(100)    NOT NULL,
    loc_addr_line1    varchar(100)    NOT NULL,
    loc_addr_line2    varchar(100)    NULL,
    loc_city          varchar(30)     NOT NULL,
    loc_state         char(2)         NOT NULL,
    loc_zip           char(5)         NOT NULL,
    zip_ext           char(4)         NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (loc_id)
)

go


IF OBJECT_ID('INVENTORY_LOCATION') IS NOT NULL
    PRINT '<<< CREATED TABLE INVENTORY_LOCATION >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE INVENTORY_LOCATION >>>'
go

/* 
 * TABLE: ORDER 
 */

CREATE TABLE ORDER(
    order_id                int             NOT NULL,
    cust_id                 int             NOT NULL,
    order_status_cd         int             NOT NULL,
    bill_to_addr_id         int             NOT NULL,
    sales_tax_id            int             NOT NULL,
    curr_id                 int             NOT NULL,
    shop_cart_id            int             NOT NULL,
    order_submit_date       time(7)         NOT NULL,
    order_process_date      time(7)         NULL,
    order_ship_date         time(7)         NULL,
    order_memo              varchar(500)    NULL,
    order_total_amnt        float           NOT NULL,
    order_sales_tax_amnt    float           NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (order_id)
)

go


IF OBJECT_ID('ORDER') IS NOT NULL
    PRINT '<<< CREATED TABLE ORDER >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ORDER >>>'
go

/* 
 * TABLE: ORDER_ITEM 
 */

CREATE TABLE ORDER_ITEM(
    order_item_id       int             NOT NULL,
    order_id            int             NOT NULL,
    prod_id             int             NOT NULL,
    ship_to_addr_id     int             NOT NULL,
    ship_meth_id        int             NOT NULL,
    cust_id             int             NOT NULL,
    item_qty            int             NOT NULL,
    item_price          float           NOT NULL,
    item_ship_price     float           NOT NULL,
    gift_msg            varchar(500)    NULL,
    gift_wrap_option    char(1)         NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (order_item_id, order_id)
)

go


IF OBJECT_ID('ORDER_ITEM') IS NOT NULL
    PRINT '<<< CREATED TABLE ORDER_ITEM >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ORDER_ITEM >>>'
go

/* 
 * TABLE: ORDER_STATUS 
 */

CREATE TABLE ORDER_STATUS(
    order_status_cd         int            NOT NULL,
    order_status_cd_name    varchar(20)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (order_status_cd)
)

go


IF OBJECT_ID('ORDER_STATUS') IS NOT NULL
    PRINT '<<< CREATED TABLE ORDER_STATUS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ORDER_STATUS >>>'
go

/* 
 * TABLE: PHONE_TYPE 
 */

CREATE TABLE PHONE_TYPE(
    phone_type_id      int             NOT NULL,
    phone_type_name    varchar(100)    NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY NONCLUSTERED (phone_type_id)
)

go


IF OBJECT_ID('PHONE_TYPE') IS NOT NULL
    PRINT '<<< CREATED TABLE PHONE_TYPE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PHONE_TYPE >>>'
go

/* 
 * TABLE: PRODUCT 
 */

CREATE TABLE PRODUCT(
    prod_id              int             NOT NULL,
    prod_cat_cd          int             NULL,
    promo_cd             int             NOT NULL,
    prod_sku             char(18)        NOT NULL,
    prod_upc             char(18)        NOT NULL,
    prod_alt_upc         char(18)        NULL,
    prod_manufact_id     char(18)        NULL,
    prod_name            varchar(100)    NOT NULL,
    prod_desc            text            NULL,
    prod_short_desc      varchar(255)    NOT NULL,
    prod_msrp_price      float           NOT NULL,
    prod_reg_price       float           NOT NULL,
    prod_discnt_price    float           NOT NULL,
    prod_height          float           NULL,
    prod_length          float           NULL,
    prod_width           float           NULL,
    prod_volume          float           NULL,
    dim_units            char(10)        NOT NULL,
    prod_weight          float           NOT NULL,
    weight_units         char(10)        NOT NULL,
    prod_thumb           image           NULL,
    prod_full_image      image           NULL,
    prod_piece_qty       int             NULL,
    prod_sort_order      varchar(18)     NULL,
    prod_last_upd        time(7)         NOT NULL,
    prod_date            date            NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (prod_id)
)

go


IF OBJECT_ID('PRODUCT') IS NOT NULL
    PRINT '<<< CREATED TABLE PRODUCT >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRODUCT >>>'
go

/* 
 * TABLE: PRODUCT_CATEGORY 
 */

CREATE TABLE PRODUCT_CATEGORY(
    prod_cat_cd            int             NOT NULL,
    sub_prod_cat_cd        int             NULL,
    prod_cat_name          varchar(100)    NOT NULL,
    prod_cat_desc          varchar(500)    NULL,
    prod_cat_image         image           NULL,
    prod_cat_sort_order    varchar(18)     NULL,
    prod_cat_special       varchar(100)    NULL,
    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (prod_cat_cd)
)

go


IF OBJECT_ID('PRODUCT_CATEGORY') IS NOT NULL
    PRINT '<<< CREATED TABLE PRODUCT_CATEGORY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PRODUCT_CATEGORY >>>'
go

/* 
 * TABLE: PROMOTION 
 */

CREATE TABLE PROMOTION(
    promo_cd                int             NOT NULL,
    promo_name              varchar(100)    NOT NULL,
    promo_start_date        date            NOT NULL,
    promo_end_date          date            NOT NULL,
    promo_discnt_percent    float           NOT NULL,
    promo_discnt_amnt       float           NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (promo_cd)
)

go


IF OBJECT_ID('PROMOTION') IS NOT NULL
    PRINT '<<< CREATED TABLE PROMOTION >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PROMOTION >>>'
go

/* 
 * TABLE: SALES_TAX 
 */

CREATE TABLE SALES_TAX(
    sales_tax_id       int        NOT NULL,
    sales_tax_amnt     float      NOT NULL,
    sales_tax_state    char(2)    NOT NULL,
    sales_tax_zip      char(5)    NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY NONCLUSTERED (sales_tax_id)
)

go


IF OBJECT_ID('SALES_TAX') IS NOT NULL
    PRINT '<<< CREATED TABLE SALES_TAX >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SALES_TAX >>>'
go

/* 
 * TABLE: SHIP_METHOD 
 */

CREATE TABLE SHIP_METHOD(
    ship_meth_id      int             NOT NULL,
    ship_meth_name    varchar(20)     NOT NULL,
    ship_meth_cost    float           NULL,
    ship_meth_desc    varchar(500)    NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (ship_meth_id)
)

go


IF OBJECT_ID('SHIP_METHOD') IS NOT NULL
    PRINT '<<< CREATED TABLE SHIP_METHOD >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SHIP_METHOD >>>'
go

/* 
 * TABLE: SHOP_CART 
 */

CREATE TABLE SHOP_CART(
    shop_cart_id           int        NOT NULL,
    prod_id                int        NOT NULL,
    shop_cart_date         time(7)    NOT NULL,
    shop_cart_qty          int        NOT NULL,
    shop_cart_sess_id      int        NOT NULL,
    active_session_flag    bit        NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (shop_cart_id)
)

go


IF OBJECT_ID('SHOP_CART') IS NOT NULL
    PRINT '<<< CREATED TABLE SHOP_CART >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SHOP_CART >>>'
go

/* 
 * TABLE: CREDIT_CARD 
 */

ALTER TABLE CREDIT_CARD ADD CONSTRAINT RefCUSTOMER12 
    FOREIGN KEY (cust_id)
    REFERENCES CUSTOMER(cust_id)
go

ALTER TABLE CREDIT_CARD ADD CONSTRAINT RefCREDIT_CARD_TYPE13 
    FOREIGN KEY (cc_type_cd)
    REFERENCES CREDIT_CARD_TYPE(cc_type_cd)
go


/* 
 * TABLE: CUSTOMER_ADDRESS 
 */

ALTER TABLE CUSTOMER_ADDRESS ADD CONSTRAINT RefCUSTOMER1 
    FOREIGN KEY (cust_id)
    REFERENCES CUSTOMER(cust_id)
go

ALTER TABLE CUSTOMER_ADDRESS ADD CONSTRAINT RefADDRESS_TYPE8 
    FOREIGN KEY (addr_type_cd)
    REFERENCES ADDRESS_TYPE(addr_type_cd)
go


/* 
 * TABLE: CUSTOMER_PHONE 
 */

ALTER TABLE CUSTOMER_PHONE ADD CONSTRAINT RefPHONE_TYPE11 
    FOREIGN KEY (phone_type_id)
    REFERENCES PHONE_TYPE(phone_type_id)
go

ALTER TABLE CUSTOMER_PHONE ADD CONSTRAINT RefCUSTOMER19 
    FOREIGN KEY (cust_id)
    REFERENCES CUSTOMER(cust_id)
go


/* 
 * TABLE: INVENTORY_ITEM 
 */

ALTER TABLE INVENTORY_ITEM ADD CONSTRAINT RefPRODUCT9 
    FOREIGN KEY (prod_id)
    REFERENCES PRODUCT(prod_id)
go

ALTER TABLE INVENTORY_ITEM ADD CONSTRAINT RefINVENTORY_LOCATION22 
    FOREIGN KEY (loc_id)
    REFERENCES INVENTORY_LOCATION(loc_id)
go


/* 
 * TABLE: ORDER 
 */

ALTER TABLE ORDER ADD CONSTRAINT RefORDER_STATUS3 
    FOREIGN KEY (order_status_cd)
    REFERENCES ORDER_STATUS(order_status_cd)
go

ALTER TABLE ORDER ADD CONSTRAINT RefSHOP_CART6 
    FOREIGN KEY (shop_cart_id)
    REFERENCES SHOP_CART(shop_cart_id)
go

ALTER TABLE ORDER ADD CONSTRAINT RefCURRENCY7 
    FOREIGN KEY (curr_id)
    REFERENCES CURRENCY(curr_id)
go

ALTER TABLE ORDER ADD CONSTRAINT RefCUSTOMER_ADDRESS17 
    FOREIGN KEY (bill_to_addr_id, cust_id)
    REFERENCES CUSTOMER_ADDRESS(cust_addr_id, cust_id)
go

ALTER TABLE ORDER ADD CONSTRAINT RefCUSTOMER20 
    FOREIGN KEY (cust_id)
    REFERENCES CUSTOMER(cust_id)
go

ALTER TABLE ORDER ADD CONSTRAINT RefSALES_TAX21 
    FOREIGN KEY (sales_tax_id)
    REFERENCES SALES_TAX(sales_tax_id)
go


/* 
 * TABLE: ORDER_ITEM 
 */

ALTER TABLE ORDER_ITEM ADD CONSTRAINT RefSHIP_METHOD5 
    FOREIGN KEY (ship_meth_id)
    REFERENCES SHIP_METHOD(ship_meth_id)
go

ALTER TABLE ORDER_ITEM ADD CONSTRAINT RefPRODUCT10 
    FOREIGN KEY (prod_id)
    REFERENCES PRODUCT(prod_id)
go

ALTER TABLE ORDER_ITEM ADD CONSTRAINT RefCUSTOMER_ADDRESS15 
    FOREIGN KEY (ship_to_addr_id, cust_id)
    REFERENCES CUSTOMER_ADDRESS(cust_addr_id, cust_id)
go

ALTER TABLE ORDER_ITEM ADD CONSTRAINT RefORDER18 
    FOREIGN KEY (order_id)
    REFERENCES ORDER(order_id)
go


/* 
 * TABLE: PRODUCT 
 */

ALTER TABLE PRODUCT ADD CONSTRAINT RefPRODUCT_CATEGORY4 
    FOREIGN KEY (prod_cat_cd)
    REFERENCES PRODUCT_CATEGORY(prod_cat_cd)
go

ALTER TABLE PRODUCT ADD CONSTRAINT RefPROMOTION16 
    FOREIGN KEY (promo_cd)
    REFERENCES PROMOTION(promo_cd)
go


/* 
 * TABLE: PRODUCT_CATEGORY 
 */

ALTER TABLE PRODUCT_CATEGORY ADD CONSTRAINT RefPRODUCT_CATEGORY14 
    FOREIGN KEY (sub_prod_cat_cd)
    REFERENCES PRODUCT_CATEGORY(prod_cat_cd)
go


/* 
 * TABLE: SHOP_CART 
 */

ALTER TABLE SHOP_CART ADD CONSTRAINT RefPRODUCT2 
    FOREIGN KEY (prod_id)
    REFERENCES PRODUCT(prod_id)
go


