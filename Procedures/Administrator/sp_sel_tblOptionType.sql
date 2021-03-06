USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblOptionType') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOptionType
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOptionType
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
			OptionTypeId
			FROM Administrator.tblOptionType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			OptionTypeId
			FROM Administrator.tblOptionType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOptionType TO CenturiaUser
GO

