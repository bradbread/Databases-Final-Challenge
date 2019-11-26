CREATE TABLE [dbo].[Sale]
(
	[SaleDate] DATE NOT NULL , 
    [PricePaid] MONEY NOT NULL, 
    [RecordID] NVARCHAR(10) NOT NULL, 
    [CustNum] INT NOT NULL, 
    [NumPurchased] INT NOT NULL, 
    CONSTRAINT [FK_Sale_Record] FOREIGN KEY ([RecordID]) REFERENCES [Record]([RecordID]), 
    CONSTRAINT [FK_Sale_Customer] FOREIGN KEY ([CustNum]) REFERENCES [Customer]([CustNum]), 
    CONSTRAINT [PK_Sale] PRIMARY KEY ([SaleDate], [CustNum], [RecordID]) 
)
