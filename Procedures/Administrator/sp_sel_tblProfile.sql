USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfile') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfile
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfile
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
			ProfileId
			FROM Administrator.tblProfile
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			ProfileId
			FROM Administrator.tblProfile
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfile TO CenturiaUser
GO

