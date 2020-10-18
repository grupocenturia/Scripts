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

