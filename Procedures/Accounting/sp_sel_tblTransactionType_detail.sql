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

