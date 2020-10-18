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

