USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblAction') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblAction
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblAction
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
			ActionId
			FROM Administrator.tblAction
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			ActionId
			FROM Administrator.tblAction
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblAction TO CenturiaUser
GO

