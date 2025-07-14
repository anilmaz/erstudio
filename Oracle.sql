--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      HR_ORACLE.DM1
--
-- Date Created : Monday, July 14, 2025 12:36:58
-- Target DBMS : Oracle 23ai
--

-- 
-- TABLE: department_dim 
--

CREATE TABLE department_dim(
    department_key     NUMBER(38, 0)    NOT NULL,
    department_id      VARCHAR2(20)     NOT NULL,
    department_name    VARCHAR2(100)    NOT NULL,
    department_head    VARCHAR2(100),
    location           VARCHAR2(100),
    CONSTRAINT PK3 PRIMARY KEY (department_key)
)
;



-- 
-- TABLE: employee_dim 
--

CREATE TABLE employee_dim(
    employee_key        NUMBER(38, 0)    NOT NULL,
    employee_id         VARCHAR2(20)     NOT NULL,
    first_name          VARCHAR2(50)     NOT NULL,
    last_name           VARCHAR2(50)     NOT NULL,
    hire_date           DATE             NOT NULL,
    termination_date    DATE,
    job_title           VARCHAR2(100)    NOT NULL,
    gender              VARCHAR2(10),
    birth_date          DATE,
    "Manager Key"       NUMBER(38, 0),
    manager_key         NUMBER(38, 0),
    CONSTRAINT PK2 PRIMARY KEY (employee_key)
)
;



-- 
-- TABLE: metrics 
--

CREATE TABLE metrics(
    metrics_key                    NUMBER(38, 0)    NOT NULL,
    employee_key                   NUMBER(38, 0)    NOT NULL,
    department_key                 NUMBER(38, 0)    NOT NULL,
    time_key                       NUMBER(38, 0)    NOT NULL,
    turnover_rate                  NUMBER(5, 2),
    training_participation_rate    NUMBER(5, 2),
    performance_rating             NUMBER(3, 2),
    absenteeism_rate               NUMBER(5, 2),
    satisfaction_rate              NUMBER(5, 2),
    engagement_score               NUMBER(5, 2),
    CONSTRAINT PK1 PRIMARY KEY (metrics_key)
)
;



-- 
-- TABLE: time_dim 
--

CREATE TABLE time_dim(
    time_key      NUMBER(38, 0)    NOT NULL,
    date          DATE             NOT NULL,
    year          NUMBER(38, 0)    NOT NULL,
    quarter       NUMBER(38, 0)    NOT NULL,
    month         NUMBER(38, 0)    NOT NULL,
    week          NUMBER(38, 0)    NOT NULL,
    day           NUMBER(38, 0)    NOT NULL,
    day_name      VARCHAR2(20)     NOT NULL,
    is_weekend    NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (time_key)
)
;



-- 
-- TABLE: employee_dim 
--

ALTER TABLE employee_dim ADD CONSTRAINT FK_EmployeeDim_Manager 
    FOREIGN KEY ("Manager Key")
    REFERENCES employee_dim(employee_key)
;


-- 
-- TABLE: metrics 
--

ALTER TABLE metrics ADD CONSTRAINT FK_Metrics_DepartmentDim 
    FOREIGN KEY (department_key)
    REFERENCES department_dim(department_key)
;

ALTER TABLE metrics ADD CONSTRAINT FK_Metrics_EmployeeDim 
    FOREIGN KEY (employee_key)
    REFERENCES employee_dim(employee_key)
;

ALTER TABLE metrics ADD CONSTRAINT FK_Metrics_TimeDim 
    FOREIGN KEY (time_key)
    REFERENCES time_dim(time_key)
;


