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

