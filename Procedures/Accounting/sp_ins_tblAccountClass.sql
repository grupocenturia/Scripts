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

