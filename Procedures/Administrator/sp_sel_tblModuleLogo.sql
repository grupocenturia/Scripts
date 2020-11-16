USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblModuleLogo') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblModuleLogo
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblModuleLogo
	(
	@ModuleId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Logo
		FROM Administrator.tblModuleLogo
		WHERE ModuleId = @ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblModuleLogo TO CenturiaUser
GO

