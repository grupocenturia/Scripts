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

