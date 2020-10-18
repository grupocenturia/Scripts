USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblModule_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblModule_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblModule_detail
	(
	@ModuleId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblModule
		WHERE ModuleId = @ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblModule_detail TO CenturiaUser
GO

