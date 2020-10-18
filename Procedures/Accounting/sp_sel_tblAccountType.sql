USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblAccountType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblAccountType
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblAccountType
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
			AccountTypeId
			FROM Accounting.tblAccountType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			AccountTypeId
			FROM Accounting.tblAccountType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblAccountType TO CenturiaUser

