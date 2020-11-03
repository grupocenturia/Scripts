USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblModule
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblModule
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN 
		SELECT Name,
			Description,
			Executable,
			Enabled,
			ModuleId
			FROM Administrator.tblModule
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			Description,
			Executable,
			ModuleId
			FROM Administrator.tblModule
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblModule TO CenturiaUser
GO

