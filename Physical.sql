/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Database2.DM1
 *
 * Date Created : Wednesday, January 29, 2025 12:47:23
 * Target DBMS : Microsoft SQL Server 2017
 */

/* 
 * TABLE: lifecycle_table 
 */

CREATE TABLE lifecycle_table(
    basic_registration_id    int     NULL,
    acec_date                date    NULL,
    fcs_target_date          date    NULL,
    is_pre_acec              bit     NULL,
    is_n_days_till_acec      bit     NULL,
    is_acec                  bit     NULL,
    is_n_days_till_fcs       bit     NULL,
    is_fcs                   bit     NULL
)

go


IF OBJECT_ID('lifecycle_table') IS NOT NULL
    PRINT '<<< CREATED TABLE lifecycle_table >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE lifecycle_table >>>'
go

/* 
 * TABLE: lifecycle_tbl 
 */

CREATE TABLE lifecycle_tbl(
    reg_id              int     NULL,
    acec_dt             date    NULL,
    fcs_dt              date    NULL,
    pre_acec            bit     NULL,
    n_days_till_acec    bit     NULL,
    acec                bit     NULL,
    n_days_till_fcs     bit     NULL,
    fcs                 bit     NULL
)

go


IF OBJECT_ID('lifecycle_tbl') IS NOT NULL
    PRINT '<<< CREATED TABLE lifecycle_tbl >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE lifecycle_tbl >>>'
go

/* 
 * TABLE: solution_table 
 */

CREATE TABLE solution_table(
    id         int     NULL,
    acec_dt    date    NULL,
    fcs_dt     date    NULL
)

go


IF OBJECT_ID('solution_table') IS NOT NULL
    PRINT '<<< CREATED TABLE solution_table >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE solution_table >>>'
go

/* 
 * TABLE: traditionalproject_table 
 */

CREATE TABLE traditionalproject_table(
    id         int     NULL,
    acec_dt    date    NULL,
    fcs_dt     date    NULL
)

go


IF OBJECT_ID('traditionalproject_table') IS NOT NULL
    PRINT '<<< CREATED TABLE traditionalproject_table >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE traditionalproject_table >>>'
go

