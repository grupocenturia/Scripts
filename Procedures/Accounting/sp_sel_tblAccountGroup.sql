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

