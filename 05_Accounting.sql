USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblAccountClass') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblAccountClass
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblAccountClass
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @AccountClassId int
	
	BEGIN TRANSACTION
		SELECT @AccountClassId = ISNULL(MAX(AccountClassId), 0) + 1
			FROM Accounting.tblAccountClass
		
		INSERT INTO Accounting.tblAccountClass
			(
			AccountClassId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@AccountClassId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION 
	
	SELECT @AccountClassId AS AccountClassId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblAccountClass TO CenturiaUser
GO	

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblAccountGroup') IS NOT NULL 
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblAccountGroup
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblAccountGroup
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @AccountGroupId int
	
	BEGIN TRANSACTION
		SELECT @AccountGroupId = ISNULL(MAX(AccountGroupId), 0) + 1
			FROM Accounting.tblAccountGroup
			
		INSERT INTO Accounting.tblAccountGroup
			(
			AccountGroupId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@AccountGroupId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @AccountGroupId AS AccountGroupId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblAccountGroup TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblAccountType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblAccountType
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblAccountType
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @AccountTypeId int
	
	BEGIN TRANSACTION
		SELECT @AccountTypeId = ISNULL(MAX(AccountTypeId), 0) + 1
			FROM Accounting.tblAccountType
			
		INSERT INTO Accounting.tblAccountType
			(
			AccountTypeId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@AccountTypeId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @AccountTypeId AS AccountTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblAccountType TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblJournalStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblJournalStatus
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblJournalStatus
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON 
	
	DECLARE @JournalStatusId int
	
	BEGIN TRANSACTION
		SELECT @JournalStatusId = ISNULL(MAX(JournalStatusId), 0) + 1
			FROM Accounting.JournalStatus
			
		INSERT INTO Accounting.JournalStatus
			(
			JournalStatusId,
			Name,
			SytemDate,
			Enabled
			)
			VALUES
			(
			@JournalStatusId,
			@name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION 
	
	SELECT @JournalStatusId AS JournalStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblJournalStatus TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblJournalType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblJournalType
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblJournalType
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @JournalTypeId int
	
	BEGIN TRANSACTION
		SELECT @JournalTypeId = ISNULL(MAX(JournalTypeId), 0) + 1
			FROM Acounting.tblJournalType
			
		INSERT INTO Acounting.tblJournalType
			(
			JournalTypeId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@JournalTypeId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @JournalTypeId AS JournalTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblJournalType TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblPeriodStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblPeriodStatus
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblPeriodStatus
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @PeriodStatusId int
	
	BEGIN TRANSACTION
		SELECT @PeriodStatusId = ISNULL(MAX(PeriodStatusId), 0) + 1
			FROM Accounting.tblPeriodStatus
			
		INSERT INTO Accounting.tblPeriodStatus
			(
			PeriodStatusId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@PeriodStatusId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @PeriodStatusId AS PeriodStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblPeriodStatus TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblTransactionType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblTransactionType
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblTransactionType
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @TransactionTypeId int
	
	BEGIN TRANSACTION
		SELECT @TransactionTypeId = ISNULL(MAX(TransactionTypeId), 0) + 1
			FROM Accounting.tblTransactionType
		
		INSERT INTO Accounting.tblTransactionType
			(
			TransactionTypeId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@TransactionTypeId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @TransactionTypeId AS TransactionTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblTransactionType TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountClass') IS NOT NULL
BEGIN 
	DROP PROCEDURE Accounting.sp_sel_tblAccountClass
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountClass
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			AccountClassId
			FROM Accounting.tblAccountClass
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			AccountClassId
			FROM Accounting.tblAccountClass
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountClass TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountClass_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblAccountClass_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountClass_detail
	(
	@AccountClassId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
	Enabled
	FROM Accounting.tblAccountClass
	WHERE AccountClassId = @AccountClassId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountClass_detail TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountGroup') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblAccountGroup
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountGroup
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON 
	
	IF @Enabled = 0
	BEGIN 
		SELECT Name,
			Enabled,
			AccountGroupId
			FROM Accounting.tblAccountGroup
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			AccountGroupId
			FROM Accounting.tblAccountGroup
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountGroup TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountGroup_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblAccountGroup_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountGroup_detail
	(
	@AccountGroupId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Accounting.tblAccountGroup
		WHERE AccountGroupId = @AccountGroupId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountGroup_detail TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblAccountType
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountType
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			AccountTypeId
			FROM Accounting.tblAccountType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			AccountTypeId
			FROM Accounting.tblAccountType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountType TO CenturiaUser

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblAccountType_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountType_detail
	(
	@AccountTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Accountin.tblAccountType
		WHERE AccountTypeId = @AccountTypeId 
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountType_detail TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalStatus
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalStatus
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			JournalStatusId
			FROM Accounting.tblJournalStatus
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			JournalStatusId
			FROM Accounting.tblJournalStatus
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO
GRANT EXECUTE ON Accounting.sp_sel_tblJournalStatus TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalStatus_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalStatus_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalStatus_detail
	(
	@JournalStatusId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Accounting.tblJournalStatus
		WHERE JournalStatusId = @JournalStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblJournalStatus_detail TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalType
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalType
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			JournalTypeId
			FROM Accounting.tblJournalType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			JournalTypeId
			FROM Accounting.tblJournalType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblJournalType TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalType_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalType_detail
	(
	@JournalTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Accounting.tblJournalType
		WHERE JournalTypeId = @JournalTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblJournalType_detail TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblPeriodStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblPeriodStatus
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblPeriodStatus
	(
	@enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			PeriodStatusId
			FROM Accounting.tblPeriodStatus
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			PeriodStatusId
			FROM Accounting.tblPeriodStatus
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblPeriodStatus TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblPeriodStatus_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblPeriodStatus_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblPeriodStatus_detail
	(
	@PeriodStatusId int
	)
AS
BEGIN
	SET NOCOUNT ON 
	
	SELECT Name,
		Enabled
		FROM Accounting.tblPeriodStatus
		WHERE PeriodStatusId = @PeriodStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblPeriodStatus_detail TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblTransactionType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblTransactionType_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblTransactionType_detail
	(
	@TransactionTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Accounting.tblTransactionType
		WHERE TransactionTypeId = @TransactionTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblTransactionType_detail TO CenturiaUser
GO

USE CNTDB01
GO 

IF OBJECT_ID('Accounting.sp_upt_tblAccountClass') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblAccountClass
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblAccountClass
	(
	@AccountClassId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblAccountClass SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE AccountClassId = @AccountClassId
		
	SELECT @AccountClassId AS AccountClassId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblAccountClass TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblAccountGroup') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblAccountGroup
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblAccountGroup
	(
	@AccountGroupId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblAccountGroup SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE AccountGroupId = @AccountGroupId
		
	SELECT @AccountGroupId AS AccountGroupId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblAccountGroup TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblAccountType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblAccountType
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblAccountType
	(
	@AccountTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblAccountType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE AccountTypeId = @AccountTypeId
		
	SELECT @AccountTypeId AS AccountTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblAccountType TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblJournalStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblJournalStatus
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblJournalStatus
	(
	@JournalStatusId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblJournalStatus SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE JournalStatusId = @JournalStatusId
		
	SELECT @JournalStatusId AS JournalStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblJournalStatus TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblJournalType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblJournalType
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblJournalType
	(
	@JournalTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblJournalType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE JournalTypeId = @JournalTypeId
		
	SELECT @JournalTypeId AS JournalTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblJournalType TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblPeriodStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblPeriodStatus
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblPeriodStatus
	(
	@PeriodStatusId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblPeriodStatus SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE PeriodStatusId = @PeriodStatusId
		
	SELECT @PeriodStatusId AS PeriodStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblPeriodStatus TO CenturiaUser
GO

USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblTransactionType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblTransactionType
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblTransactionType
	(
	@TransactionTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accouting.tblTransactionType SET 
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE @TransactionTypeId = @TransactionTypeId
		
	SELECT @TransactionTypeId AS TransactionTypeId 
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblTransactionType TO  CenturiaUser
GO

