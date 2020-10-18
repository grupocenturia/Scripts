USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountClass') IS NOT NULL
BEGIN 
	DROP PROCEDURE Accounting.sp_sel_tblAccountClass
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountClass
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
			AccountClassId
			FROM Accounting.tblAccountClass
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			AccountClassId
			FROM Accounting.tblAccountClass
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountClass TO CenturiaUser
GO

