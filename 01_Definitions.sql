/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases 12.1.0                     */
/* Target DBMS:           MS SQL Server 2017                              */
/* Project file:          Centuria.dez                                    */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2020-09-10 00:00                                */
/* ---------------------------------------------------------------------- */


--DATABASE
USE master
GO

IF EXISTS
	(SELECT 1
	FROM sys.databases
	WHERE name = 'CNTDB01')
BEGIN
	ALTER DATABASE CNTDB01
		SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE

	DROP DATABASE CNTDB01
END
GO

IF EXISTS
	(SELECT 1
	FROM sys.databases
	WHERE name = 'CNTDB00')
BEGIN
	ALTER DATABASE CNTDB00
		SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE

	DROP DATABASE CNTDB00
END
GO

CREATE DATABASE CNTDB00
	ON PRIMARY
	(
	NAME = N'CNTDB00_data',
	FILENAME = N'C:\Centuria\Data\CNTDB00.mdf', 
	SIZE = 100MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10MB
	),
	FILEGROUP CNTFS
	CONTAINS FILESTREAM
	(
    NAME = N'CNTFS00',
    FILENAME = N'C:\Centuria\Data\CNTFS00')
	LOG ON
	(
	NAME = N'CNTDB00_log',
	FILENAME = N'C:\Centuria\Data\CNTDB00.ldf',
	SIZE = 100MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10MB
	)
GO

CREATE DATABASE CNTDB01
	ON PRIMARY
	(
	NAME = N'CNTDB01_data',
	FILENAME = N'C:\Centuria\Data\CNTDB01.mdf', 
	SIZE = 100MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10MB
	),
	FILEGROUP CNTFS
	CONTAINS FILESTREAM
	(
    NAME = N'CNTFS01',
    FILENAME = N'C:\Centuria\Data\CNTFS01')
	LOG ON
	(
	NAME = N'CNTDB01_log',
	FILENAME = N'C:\Centuria\Data\CNTDB01.ldf',
	SIZE = 100MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10MB
	)
GO

--USER
IF EXISTS
	(SELECT 1
	FROM sys.server_principals
	WHERE type = 'S' AND
	name = 'CenturiaUser')
BEGIN
	DROP LOGIN CenturiaUser
END
GO

CREATE LOGIN CenturiaUser
	WITH PASSWORD = 'GrupoCenturia2020--',
	DEFAULT_DATABASE = CNTDB00
GO

USE CNTDB00
GO

CREATE USER CenturiaUser
	FROM LOGIN CenturiaUser
GO

USE CNTDB01
GO

CREATE USER CenturiaUser
	FROM LOGIN CenturiaUser
GO

--SCHEMA
USE CNTDB00
GO
CREATE SCHEMA Administrator
GO
CREATE SCHEMA Core
GO

USE CNTDB01
GO
CREATE SCHEMA Accounting
GO


--CERT
USE CNTDB00
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'GrupoCenturia2020--'
GO

CREATE CERTIFICATE CenturiaCert
	WITH SUBJECT = 'Centuria'
GO

CREATE SYMMETRIC KEY CenturiaKey 
	WITH ALGORITHM = AES_256
	ENCRYPTION BY CERTIFICATE CenturiaCert
GO

GRANT VIEW DEFINITION ON SYMMETRIC KEY::CenturiaKey TO CenturiaUser
GO

GRANT CONTROL ON CERTIFICATE::CenturiaCert TO CenturiaUser
GO

/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblAccountType"                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblAccountType] (
    [AccountTypeId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblAccountType] PRIMARY KEY ([AccountTypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblAccountGroup"                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblAccountGroup] (
    [AccountGroupId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblAccountGroup] PRIMARY KEY ([AccountGroupId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblAccountClass"                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblAccountClass] (
    [AccountClassId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblAccountClass] PRIMARY KEY ([AccountClassId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblUser"                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblUser] (
    [UserId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [UserName] VARCHAR(100) NOT NULL,
    [Password] VARBINARY(max) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblUser] PRIMARY KEY ([UserId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblProfile"                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblProfile] (
    [ProfileId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblProfile] PRIMARY KEY ([ProfileId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblCompany"                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblCompany] (
    [CompanyId] INTEGER NOT NULL,
    [Name] VARCHAR(200) NOT NULL,
    [TradeName] VARCHAR(100) NOT NULL,
    [ShortName] VARCHAR(20) NOT NULL,
    [DBName] VARCHAR(20) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblCompany] PRIMARY KEY ([CompanyId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblModule"                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblModule] (
    [ModuleId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT,
    CONSTRAINT [pk_tblModule] PRIMARY KEY ([ModuleId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblMenu"                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblMenu] (
    [MenuId] INTEGER NOT NULL,
    [ModuleId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblMenu] PRIMARY KEY ([MenuId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblProfileUser"                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblProfileUser] (
    [ProfileId] INTEGER NOT NULL,
    [UserId] INTEGER NOT NULL,
    [CompanyId] INTEGER NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    CONSTRAINT [pk_tblProfileUser] PRIMARY KEY ([ProfileId], [UserId], [CompanyId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblStore"                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblStore] (
    [StoreId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblStore] PRIMARY KEY ([StoreId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Core.tblDataType"                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Core].[tblDataType] (
    [DataTypeId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblDataType] PRIMARY KEY ([DataTypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblAction"                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblAction] (
    [ActionId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblAction] PRIMARY KEY ([ActionId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblCompanyLogo"                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblCompanyLogo] (
    [CompanyId] INTEGER NOT NULL,
    [Logo] VARBINARY(max) FILESTREAM NOT NULL,
    [LogoGuid] UNIQUEIDENTIFIER ROWGUIDCOL UNIQUE DEFAULT NEWID() NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    CONSTRAINT [pk_tblCompanyLogo] PRIMARY KEY ([CompanyId])
)
FILESTREAM_ON CNTFS
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblModuleLogo"                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblModuleLogo] (
    [ModuleId] INTEGER NOT NULL,
    [Logo] VARBINARY(max) FILESTREAM NOT NULL,
    [LogoGuid] UNIQUEIDENTIFIER ROWGUIDCOL UNIQUE DEFAULT NEWID() NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    CONSTRAINT [pk_tblModuleLogo] PRIMARY KEY ([ModuleId])
)
FILESTREAM_ON CNTFS
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblOptionType"                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblOptionType] (
    [OptionTypeId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblOptionType] PRIMARY KEY ([OptionTypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Core.tblCurrency"                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Core].[tblCurrency] (
    [CurrencyId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [IsoCode] VARCHAR(3) NOT NULL,
    [Symbol] VARCHAR(10) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblCurrency] PRIMARY KEY ([CurrencyId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Core.tblCountry"                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Core].[tblCountry] (
    [CountryId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [IsoCode] VARCHAR(2) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblCountry] PRIMARY KEY ([CountryId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Core.tblLanguage"                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Core].[tblLanguage] (
    [LanguageId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblLanguage] PRIMARY KEY ([LanguageId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Core.tblState"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Core].[tblState] (
    [StateId] INTEGER NOT NULL,
    [CountryId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblState] PRIMARY KEY ([StateId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Core.tblCity"                                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Core].[tblCity] (
    [CityId] INTEGER NOT NULL,
    [StateId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblCity] PRIMARY KEY ([CityId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblJournalStatus"                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblJournalStatus] (
    [JournalStatusId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblJournalStatus] PRIMARY KEY ([JournalStatusId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblJournalType"                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblJournalType] (
    [JournalTypeId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblJournalType] PRIMARY KEY ([JournalTypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblTransactionType"                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblTransactionType] (
    [TransactionTypeId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblTransactionType] PRIMARY KEY ([TransactionTypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblPeriodStatus"                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblPeriodStatus] (
    [PeriodStatusId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblPeriodStatus] PRIMARY KEY ([PeriodStatusId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblSetting"                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblSetting] (
    [JournalSummary] BIT NOT NULL
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Core.tblParameter"                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Core].[tblParameter] (
    [ParameterId] INTEGER NOT NULL,
    [DataTypeId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [Length] INTEGER NOT NULL,
    [Decimals] INTEGER NOT NULL,
    [Format] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblParameter] PRIMARY KEY ([ParameterId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblAccount"                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblAccount] (
    [AccountId] INTEGER NOT NULL,
    [ParentId] INTEGER,
    [AccountTypeId] INTEGER NOT NULL,
    [AccountGroupId] INTEGER NOT NULL,
    [AccountClassId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(max) NOT NULL,
    [Account] VARCHAR(50) UNIQUE NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblAccount] PRIMARY KEY ([AccountId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblPeriod"                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblPeriod] (
    [PeriodId] INTEGER NOT NULL,
    [PeriodStatusId] INTEGER NOT NULL,
    [Year] INTEGER NOT NULL,
    [Month] INTEGER NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblPeriod] PRIMARY KEY ([PeriodId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblJournal"                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblJournal] (
    [Journald] INTEGER NOT NULL,
    [JournalStatusId] INTEGER NOT NULL,
    [JournalTypeId] INTEGER NOT NULL,
    [PeriodId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [ProcessDate] DATE NOT NULL,
    [Description] VARCHAR(max) NOT NULL,
    [RejectReason] VARCHAR(100),
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblJournal] PRIMARY KEY ([Journald])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblJournalDetails"                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblJournalDetails] (
    [Journald] INTEGER NOT NULL,
    [RowNumber] INTEGER NOT NULL,
    [AccountId] INTEGER NOT NULL,
    [TransactionTypeId] INTEGER NOT NULL,
    [Sub] VARCHAR(50) NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(max) NOT NULL,
    [Amount] NUMERIC(20,2) NOT NULL,
    CONSTRAINT [pk_tblJournalDetails] PRIMARY KEY ([Journald], [RowNumber])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblOption"                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblOption] (
    [OptionId] INTEGER NOT NULL,
    [MenuId] INTEGER NOT NULL,
    [OptionTypeId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [OptionName] VARCHAR(100) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblOption] PRIMARY KEY ([OptionId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblLog"                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblLog] (
    [LogId] INTEGER NOT NULL,
    [UserId] INTEGER NOT NULL,
    [OptionId] INTEGER NOT NULL,
    [CompanyId] INTEGER NOT NULL,
    [ActionId] INTEGER NOT NULL,
    [Description] VARCHAR(max) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    CONSTRAINT [pk_tblLog] PRIMARY KEY ([LogId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblSetting"                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblSetting] (
    [SettingId] INTEGER NOT NULL,
    [ParameterId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(max) NOT NULL,
    [Variable] VARCHAR(100) NOT NULL,
    [Value] VARCHAR(max) NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblSetting] PRIMARY KEY ([SettingId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblProfileOption"                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblProfileOption] (
    [ProfileId] INTEGER NOT NULL,
    [OptionId] INTEGER NOT NULL,
    [SystemDate] DATETIME NOT NULL,
    CONSTRAINT [pk_tblProfileOption] PRIMARY KEY ([ProfileId], [OptionId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB00.Administrator.tblLicense"                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB00].[Administrator].[tblLicense] (
    [LicenseId] INTEGER NOT NULL,
    [CompanyId] INTEGER,
    [StoreId] INTEGER,
    [UserId] INTEGER,
    [Key] VARBINARY(max) NOT NULL,
    [ExpirationDate] DATETIME,
    [ComputerName] VARCHAR(100),
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblLicense] PRIMARY KEY ([LicenseId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblBalance"                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblBalance] (
    [PeriodId] INTEGER NOT NULL,
    [AccountId] INTEGER NOT NULL,
    [Sub] VARCHAR(50) NOT NULL,
    [BeginAmount] NUMERIC(20,2) NOT NULL,
    [Debit] NUMERIC(20,2) NOT NULL,
    [Credit] NUMERIC(20,2) NOT NULL,
    [EndAmount] NUMERIC(20,2) NOT NULL,
    CONSTRAINT [pk_tblBalance] PRIMARY KEY ([PeriodId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblJournalSummary"                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblJournalSummary] (
    [JournalSummaryld] INTEGER NOT NULL,
    [JournalStatusId] INTEGER NOT NULL,
    [JournalTypeId] INTEGER NOT NULL,
    [PeriodId] INTEGER NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    [ProcessDate] DATE NOT NULL,
    [Description] VARCHAR(max) NOT NULL,
    [RejectReason] VARCHAR(100),
    [SystemDate] DATETIME NOT NULL,
    [Enabled] BIT NOT NULL,
    CONSTRAINT [pk_tblJournalSummary] PRIMARY KEY ([JournalSummaryld])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CNTDB01.Accounting.tblJournalSummaryDetails"                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [CNTDB01].[Accounting].[tblJournalSummaryDetails] (
    [JournalSummaryld] INTEGER NOT NULL,
    [Journald] INTEGER UNIQUE NOT NULL,
    CONSTRAINT [pk_tblJournalSummaryDetails] PRIMARY KEY ([JournalSummaryld], [Journald])
)
GO


/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE [CNTDB01].[Accounting].[tblAccount] ADD CONSTRAINT [fk_tblAccount_tblAccountType] 
    FOREIGN KEY ([AccountTypeId]) REFERENCES [CNTDB01].[Accounting].[tblAccountType] ([AccountTypeId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblAccount] ADD CONSTRAINT [fk_tblAccount_tblAccountGroup] 
    FOREIGN KEY ([AccountGroupId]) REFERENCES [CNTDB01].[Accounting].[tblAccountGroup] ([AccountGroupId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblAccount] ADD CONSTRAINT [fk_tblAccount_tblAccountClass] 
    FOREIGN KEY ([AccountClassId]) REFERENCES [CNTDB01].[Accounting].[tblAccountClass] ([AccountClassId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblAccount] ADD CONSTRAINT [fk_tblAccount_tblAccount] 
    FOREIGN KEY ([ParentId]) REFERENCES [CNTDB01].[Accounting].[tblAccount] ([AccountId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblPeriod] ADD CONSTRAINT [fk_tblPeriod_tblPeriodStatus] 
    FOREIGN KEY ([PeriodStatusId]) REFERENCES [CNTDB01].[Accounting].[tblPeriodStatus] ([PeriodStatusId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournal] ADD CONSTRAINT [fk_tblJournal_tblJournalStatus] 
    FOREIGN KEY ([JournalStatusId]) REFERENCES [CNTDB01].[Accounting].[tblJournalStatus] ([JournalStatusId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournal] ADD CONSTRAINT [fk_tblJournal_tblJournalType] 
    FOREIGN KEY ([JournalTypeId]) REFERENCES [CNTDB01].[Accounting].[tblJournalType] ([JournalTypeId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournal] ADD CONSTRAINT [fk_tblJournal_tblPeriod] 
    FOREIGN KEY ([PeriodId]) REFERENCES [CNTDB01].[Accounting].[tblPeriod] ([PeriodId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalDetails] ADD CONSTRAINT [fk_tblJournalDetails_tblJournal] 
    FOREIGN KEY ([Journald]) REFERENCES [CNTDB01].[Accounting].[tblJournal] ([Journald])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalDetails] ADD CONSTRAINT [fk_tblJournalDetails_tblAccount] 
    FOREIGN KEY ([AccountId]) REFERENCES [CNTDB01].[Accounting].[tblAccount] ([AccountId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalDetails] ADD CONSTRAINT [fk_tblJournalDetails_tblTransactionType] 
    FOREIGN KEY ([TransactionTypeId]) REFERENCES [CNTDB01].[Accounting].[tblTransactionType] ([TransactionTypeId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblMenu] ADD CONSTRAINT [fk_tblMenu_tblModule] 
    FOREIGN KEY ([ModuleId]) REFERENCES [CNTDB00].[Administrator].[tblModule] ([ModuleId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblOption] ADD CONSTRAINT [fk_tblOption_tblMenu] 
    FOREIGN KEY ([MenuId]) REFERENCES [CNTDB00].[Administrator].[tblMenu] ([MenuId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblOption] ADD CONSTRAINT [fk_tblOption_tblOptionType] 
    FOREIGN KEY ([OptionTypeId]) REFERENCES [CNTDB00].[Administrator].[tblOptionType] ([OptionTypeId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblLog] ADD CONSTRAINT [fk_tblLog_tblUser] 
    FOREIGN KEY ([UserId]) REFERENCES [CNTDB00].[Administrator].[tblUser] ([UserId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblLog] ADD CONSTRAINT [fk_tblLog_tblOption] 
    FOREIGN KEY ([OptionId]) REFERENCES [CNTDB00].[Administrator].[tblOption] ([OptionId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblLog] ADD CONSTRAINT [fk_tblLog_tblCompany] 
    FOREIGN KEY ([CompanyId]) REFERENCES [CNTDB00].[Administrator].[tblCompany] ([CompanyId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblLog] ADD CONSTRAINT [fk_tblLog_tblAction] 
    FOREIGN KEY ([ActionId]) REFERENCES [CNTDB00].[Administrator].[tblAction] ([ActionId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblSetting] ADD CONSTRAINT [fk_tblSetting_tblParameter] 
    FOREIGN KEY ([ParameterId]) REFERENCES [CNTDB00].[Core].[tblParameter] ([ParameterId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblProfileUser] ADD CONSTRAINT [fk_tblProfileUser_tblUser] 
    FOREIGN KEY ([UserId]) REFERENCES [CNTDB00].[Administrator].[tblUser] ([UserId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblProfileUser] ADD CONSTRAINT [fk_tblProfileUser_tblProfile] 
    FOREIGN KEY ([ProfileId]) REFERENCES [CNTDB00].[Administrator].[tblProfile] ([ProfileId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblProfileUser] ADD CONSTRAINT [fk_tblProfileUser_tblCompany] 
    FOREIGN KEY ([CompanyId]) REFERENCES [CNTDB00].[Administrator].[tblCompany] ([CompanyId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblProfileOption] ADD CONSTRAINT [fk_tblProfileOption_tblProfile] 
    FOREIGN KEY ([ProfileId]) REFERENCES [CNTDB00].[Administrator].[tblProfile] ([ProfileId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblProfileOption] ADD CONSTRAINT [fk_tblProfileOption_tblOption] 
    FOREIGN KEY ([OptionId]) REFERENCES [CNTDB00].[Administrator].[tblOption] ([OptionId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblLicense] ADD CONSTRAINT [fk_tblLicense_tblUser] 
    FOREIGN KEY ([UserId]) REFERENCES [CNTDB00].[Administrator].[tblUser] ([UserId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblLicense] ADD CONSTRAINT [fk_tblLicense_tblCompany] 
    FOREIGN KEY ([CompanyId]) REFERENCES [CNTDB00].[Administrator].[tblCompany] ([CompanyId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblLicense] ADD CONSTRAINT [fk_tblLicense_tblStore] 
    FOREIGN KEY ([StoreId]) REFERENCES [CNTDB00].[Administrator].[tblStore] ([StoreId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblCompanyLogo] ADD CONSTRAINT [fk_tblCompanyLogo_tblCompany] 
    FOREIGN KEY ([CompanyId]) REFERENCES [CNTDB00].[Administrator].[tblCompany] ([CompanyId])
GO


ALTER TABLE [CNTDB00].[Administrator].[tblModuleLogo] ADD CONSTRAINT [fk_tblModuleLogo_tblModule] 
    FOREIGN KEY ([ModuleId]) REFERENCES [CNTDB00].[Administrator].[tblModule] ([ModuleId])
GO


ALTER TABLE [CNTDB00].[Core].[tblState] ADD CONSTRAINT [fk_tblState_tblCountry] 
    FOREIGN KEY ([CountryId]) REFERENCES [CNTDB00].[Core].[tblCountry] ([CountryId])
GO


ALTER TABLE [CNTDB00].[Core].[tblCity] ADD CONSTRAINT [fk_tblCity_tblState] 
    FOREIGN KEY ([StateId]) REFERENCES [CNTDB00].[Core].[tblState] ([StateId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblBalance] ADD CONSTRAINT [fk_tblBalance_tblPeriod] 
    FOREIGN KEY ([PeriodId]) REFERENCES [CNTDB01].[Accounting].[tblPeriod] ([PeriodId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblBalance] ADD CONSTRAINT [fk_tblBalance_tblAccount] 
    FOREIGN KEY ([AccountId]) REFERENCES [CNTDB01].[Accounting].[tblAccount] ([AccountId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalSummary] ADD CONSTRAINT [fk_tblJournalSummary_tblJournalStatus] 
    FOREIGN KEY ([JournalStatusId]) REFERENCES [CNTDB01].[Accounting].[tblJournalStatus] ([JournalStatusId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalSummary] ADD CONSTRAINT [fk_tblJournalSummary_tblJournalType] 
    FOREIGN KEY ([JournalTypeId]) REFERENCES [CNTDB01].[Accounting].[tblJournalType] ([JournalTypeId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalSummary] ADD CONSTRAINT [fk_tblJournalSummary_tblPeriod] 
    FOREIGN KEY ([PeriodId]) REFERENCES [CNTDB01].[Accounting].[tblPeriod] ([PeriodId])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalSummaryDetails] ADD CONSTRAINT [fk_tblJournalSummaryDetails_tblJournalSummary] 
    FOREIGN KEY ([JournalSummaryld]) REFERENCES [CNTDB01].[Accounting].[tblJournalSummary] ([JournalSummaryld])
GO


ALTER TABLE [CNTDB01].[Accounting].[tblJournalSummaryDetails] ADD CONSTRAINT [fk_tblJournalSummaryDetails_tblJournal] 
    FOREIGN KEY ([Journald]) REFERENCES [CNTDB01].[Accounting].[tblJournal] ([Journald])
GO


ALTER TABLE [CNTDB00].[Core].[tblParameter] ADD CONSTRAINT [fk_tblParameter_tblDataType] 
    FOREIGN KEY ([DataTypeId]) REFERENCES [CNTDB00].[Core].[tblDataType] ([DataTypeId])
GO

