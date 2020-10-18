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

