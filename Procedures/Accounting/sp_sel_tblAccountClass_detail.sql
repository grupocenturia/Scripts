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

