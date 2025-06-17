/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      DATA MODEL
 *
 * Date Created : Tuesday, June 17, 2025 08:34:19
 * Target DBMS : Microsoft SQL Server 2022
 */

/* 
 * TABLE: Books 
 */

CREATE TABLE Books(
    BookID       int              NOT NULL,
    Title        nvarchar(100)    NULL,
    Author       nvarchar(100)    NULL,
    ISBN         nvarchar(20)     NULL,
    LibraryID    int              NULL,
    CONSTRAINT PK__Books__3DE0C227A4029391 PRIMARY KEY CLUSTERED (BookID)
)

go


IF OBJECT_ID('Books') IS NOT NULL
    PRINT '<<< CREATED TABLE Books >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Books >>>'
go

/* 
 * TABLE: Classrooms 
 */

CREATE TABLE Classrooms(
    ClassroomID    int              NOT NULL,
    Building       nvarchar(100)    NULL,
    RoomNumber     nvarchar(10)     NULL,
    CONSTRAINT PK__Classroo__11618E8A07E47B30 PRIMARY KEY CLUSTERED (ClassroomID)
)

go


IF OBJECT_ID('Classrooms') IS NOT NULL
    PRINT '<<< CREATED TABLE Classrooms >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Classrooms >>>'
go

/* 
 * TABLE: Courses 
 */

CREATE TABLE Courses(
    CourseID      int              NOT NULL,
    CourseName    nvarchar(100)    NULL,
    Credits       int              NULL,
    CONSTRAINT PK__Courses__C92D718724C49B1F PRIMARY KEY CLUSTERED (CourseID)
)

go


IF OBJECT_ID('Courses') IS NOT NULL
    PRINT '<<< CREATED TABLE Courses >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Courses >>>'
go

/* 
 * TABLE: CourseSchedules 
 */

CREATE TABLE CourseSchedules(
    ScheduleID      int         NOT NULL,
    CourseID        int         NULL,
    InstructorID    int         NULL,
    ClassroomID     int         NULL,
    ScheduleTime    datetime    NULL,
    CONSTRAINT PK__CourseSc__9C8A5B69466F8F71 PRIMARY KEY CLUSTERED (ScheduleID)
)

go


IF OBJECT_ID('CourseSchedules') IS NOT NULL
    PRINT '<<< CREATED TABLE CourseSchedules >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CourseSchedules >>>'
go

/* 
 * TABLE: Departments 
 */

CREATE TABLE Departments(
    DepartmentID      int               NOT NULL,
    DepartmentName    nvarchar(100)     NULL,
    Budget            decimal(18, 2)    NULL,
    CONSTRAINT PK__Departme__B2079BCD585FA90C PRIMARY KEY CLUSTERED (DepartmentID)
)

go


IF OBJECT_ID('Departments') IS NOT NULL
    PRINT '<<< CREATED TABLE Departments >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Departments >>>'
go

/* 
 * TABLE: Enrollments 
 */

CREATE TABLE Enrollments(
    EnrollmentID    int            NOT NULL,
    StudentID       int            NULL,
    CourseID        int            NULL,
    Grade           nvarchar(2)    NULL,
    CONSTRAINT PK__Enrollme__7F6877FB4A7D9AB5 PRIMARY KEY CLUSTERED (EnrollmentID)
)

go


IF OBJECT_ID('Enrollments') IS NOT NULL
    PRINT '<<< CREATED TABLE Enrollments >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Enrollments >>>'
go

/* 
 * TABLE: Instructors 
 */

CREATE TABLE Instructors(
    InstructorID    int             NOT NULL,
    FirstName       nvarchar(50)    NULL,
    LastName        nvarchar(50)    NULL,
    HireDate        date            NULL,
    DepartmentID    int             NULL,
    CONSTRAINT PK__Instruct__9D010B7B50A368DE PRIMARY KEY CLUSTERED (InstructorID)
)

go


IF OBJECT_ID('Instructors') IS NOT NULL
    PRINT '<<< CREATED TABLE Instructors >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Instructors >>>'
go

/* 
 * TABLE: Libraries 
 */

CREATE TABLE Libraries(
    LibraryID      int              NOT NULL,
    LibraryName    nvarchar(100)    NULL,
    Location       nvarchar(100)    NULL,
    CONSTRAINT PK__Librarie__A13647BF327333AE PRIMARY KEY CLUSTERED (LibraryID)
)

go


IF OBJECT_ID('Libraries') IS NOT NULL
    PRINT '<<< CREATED TABLE Libraries >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Libraries >>>'
go

/* 
 * TABLE: LibraryMemberships 
 */

CREATE TABLE LibraryMemberships(
    MembershipID      int     NOT NULL,
    StudentID         int     NULL,
    LibraryID         int     NULL,
    MembershipDate    date    NULL,
    CONSTRAINT PK__LibraryM__92A7859927137C21 PRIMARY KEY CLUSTERED (MembershipID)
)

go


IF OBJECT_ID('LibraryMemberships') IS NOT NULL
    PRINT '<<< CREATED TABLE LibraryMemberships >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LibraryMemberships >>>'
go

/* 
 * TABLE: Students 
 */

CREATE TABLE Students(
    StudentID         int             NOT NULL,
    FirstName         nvarchar(50)    NULL,
    LastName          nvarchar(50)    NULL,
    DateOfBirth       date            NULL,
    Gender            nvarchar(10)    NULL,
    EnrollmentDate    date            NULL,
    CONSTRAINT PK__Students__32C52A79DCE94383 PRIMARY KEY CLUSTERED (StudentID)
)

go


IF OBJECT_ID('Students') IS NOT NULL
    PRINT '<<< CREATED TABLE Students >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Students >>>'
go

