CREATE TABLE [dbo].[Customer]
(
	[CustNum] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(100) NOT NULL, 
    [Adress] NVARCHAR(100) NOT NULL, 
    [PostCode] INT NOT NULL, 
    [IntrestCode] NCHAR(2) NOT NULL, 
    CONSTRAINT [FK_Customer_SpecialIntrest] FOREIGN KEY ([IntrestCode]) REFERENCES [SpecialIntrest]([IntrestCode])
)
