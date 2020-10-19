USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblSetting') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblSetting
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblSetting
AS
BEGIN
	SET NOCOUNT ON

	SELECT 1 AS SettingId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblSetting TO CenturiaUser
GO

