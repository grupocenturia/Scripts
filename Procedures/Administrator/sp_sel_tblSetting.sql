USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblSetting') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblSetting
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblSetting
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
			Variable,
			Value,
			Enabled,
			SettingId,
			ParameterId
			FROM Administrator.tblSetting
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			Description,
			Variable,
			Value,
			SettingId,
			ParameterId
			FROM Administrator.tblSetting
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblSetting TO CenturiaUser
GO

