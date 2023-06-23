CREATE TABLE [dbo].[Categories](
    CategoryID INT NOT NULL IDENTITY(1,1),
    Name NVARCHAR(150) NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED
    (
        [CategoryID] ASC
    )
)

CREATE TABLE [dbo].[Products](
    ProductID INT NOT NULL IDENTITY(1,1),
    Name NVARCHAR(150) NOT NULL,
    Description NVARCHAR(250) NULL,
    CategoryID INT NOT NULL,
    DateTimeCreated DATETIME,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED
    (
        [ProductID] ASC
    ),
    CONSTRAINT [FK_Categories] FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
)