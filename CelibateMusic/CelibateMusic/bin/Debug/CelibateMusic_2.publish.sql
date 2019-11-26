﻿/*
Deployment script for SQL-Tasks

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SQL-Tasks"
:setvar DefaultFilePrefix "SQL-Tasks"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


INSERT INTO SpecialIntrest (IntrestCode, [Description]) VALUES 
('RR', 'Rock and Roll'),
('JA', 'Jazz'),
('RB', 'Rhythm and Blues');




INSERT INTO Customer (CustNum, [Name], Adress, PostCode, IntrestCode) VALUES
(123, 'Jimmy Barnes', '1 Seasame Street', 3000, 'RR'),
(456, 'Ian Moss', '10 Downing Street', 4000, 'JA'),
(789, 'Don Walker', '221B Baker Street', 5000, 'RB'),
(234, 'Steve Prestwich', 'LG1 College Cres, Parkville', 6000, 'RR'),
(567, 'Phil Small', '1 Adelaide Avenue', 7000, 'RB');


INSERT INTO Record (RecordID, Title, Performer) VALUES
('PF003', 'The Wall', 'Pink Floyd'),
('IX002', 'Kick', 'INXS'),
('SP069', 'Never Mind the Bollocoks', 'Sex Pistols'),
('PF002', 'The Dark Side of the Moon', 'Pink Floyd'),
('IX005', 'Shabooh Shoobah', 'INXS'),
('SP070', 'Floggin a Dead Horse', 'Sex Pistols'),
('PF004', 'The Endless River', 'Pink Floyd'),
('PF006', 'Wish You Were Here', 'Pink Floyd'),
('SP075', 'Agents of Anarchy', 'Sex Pistols'),
('PF007', 'The Division Bell', 'Pink Floyd');


INSERT INTO Sale (SaleDate, PricePaid, NumPurchased, RecordID, CustNum) VALUES
('2015-12-1', $30.00, 1, 'PF003', 123),
('2015-12-1', $29.95, 1, 'IX002', 123),
('2015-12-2', $12.45, 1, 'SP069', 123),
('2015-12-5', $30.00, 1, 'IX002', 123),
('2015-12-1', $31.00, 1, 'PF002', 456),
('2015-12-3', $28.95, 1, 'IX005', 456),
('2015-12-6', $13.45, 1, 'SP070', 456),
('2015-12-2', $29.00, 1, 'PF004', 789),
('2015-12-5', $29.95, 1, 'IX002', 789),
('2015-12-1', $45.00, 1, 'PF006', 234),
('2015-12-4', $5.67, 1, 'SP075', 234),
('2015-12-3', $9.95, 1, 'PF007', 567);
GO

GO
PRINT N'Update complete.';


GO
