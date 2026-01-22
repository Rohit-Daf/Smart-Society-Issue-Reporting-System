-- Database: SmartSocietyDB
-- SCHEMAS
CREATE SCHEMA auth;
GO CREATE SCHEMA issues;
GO -- USER TABLE
    CREATE TABLE auth.[USER] (
        userId INT IDENTITY PRIMARY KEY,
        name NVARCHAR(100) NOT NULL,
        flatNo NVARCHAR(20),
        phone NVARCHAR(15),
        email NVARCHAR(100) UNIQUE NOT NULL,
        role NVARCHAR(50) NOT NULL,
        passwordHash NVARCHAR(255) NOT NULL
    );
-- STAFF TABLE
CREATE TABLE issues.STAFF (
    staffId INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    role NVARCHAR(50),
    phone NVARCHAR(15)
);
-- ISSUE TABLE
CREATE TABLE issues.ISSUE (
    issueId INT IDENTITY PRIMARY KEY,
    title NVARCHAR(200) NOT NULL,
    description NVARCHAR(MAX),
    category NVARCHAR(50),
    priority NVARCHAR(20),
    status NVARCHAR(20),
    flatNo NVARCHAR(20),
    createdAt DATETIME DEFAULT GETDATE(),
    createdBy INT NOT NULL,
    CONSTRAINT FK_Issue_User FOREIGN KEY (createdBy) REFERENCES auth.[USER](userId)
);
-- ASSIGNMENT TABLE
CREATE TABLE issues.ASSIGNMENT (
    assignmentId INT IDENTITY PRIMARY KEY,
    issueId INT NOT NULL,
    staffId INT NOT NULL,
    assignedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Assignment_Issue FOREIGN KEY (issueId) REFERENCES issues.ISSUE(issueId),
    CONSTRAINT FK_Assignment_Staff FOREIGN KEY (staffId) REFERENCES issues.STAFF(staffId)
);
-- COMMENT TABLE
CREATE TABLE issues.COMMENT (
    commentId INT IDENTITY PRIMARY KEY,
    issueId INT NOT NULL,
    userId INT NOT NULL,
    message NVARCHAR(MAX),
    createdAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Comment_Issue FOREIGN KEY (issueId) REFERENCES issues.ISSUE(issueId),
    CONSTRAINT FK_Comment_User FOREIGN KEY (userId) REFERENCES auth.[USER](userId)
);
-- AUDIT LOG TABLE
CREATE TABLE issues.AUDITLOG (
    logId INT IDENTITY PRIMARY KEY,
    userId INT NOT NULL,
    action NVARCHAR(200),
    entityType NVARCHAR(50),
    entityId INT,
    timestamp DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Audit_User FOREIGN KEY (userId) REFERENCES auth.[USER](userId)
);