
-- Drop Other Constraints SQL

ALTER TABLE dbo.ADR
    DROP CONSTRAINT PK4
go


-- Standard Alter Table SQL

EXEC sp_rename N'dbo.ADR.COUNTRY', N'CNTY', N'COLUMN'
go


-- Add Constraint SQL


ALTER TABLE dbo.ADR
    ADD CONSTRAINT PK4
    PRIMARY KEY NONCLUSTERED (ADR_ID)
     ON [PRIMARY]
go

