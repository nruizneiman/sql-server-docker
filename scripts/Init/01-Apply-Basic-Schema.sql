CREATE TABLE [dbo].[Categories](
    CategoryID INT NOT NULL IDENTITY(1,1),
    Name NVARCHAR(150) NOT NULL
)

CREATE TABLE [dbo].[Products](
    ProductID INT NOT NULL IDENTITY(1,1),
    Name NVARCHAR(150) NOT NULL,
    Description NVARCHAR(250) NULL,
    CategoryID INT NOT NULL,
    DateTimeCreated DATETIME
)