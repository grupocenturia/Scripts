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

