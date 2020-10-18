USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblMenu') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblMenu
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblMenu
	(
	@ModuleId int,
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN 
		SELECT Name,
			Enabled,
			MenuId
			FROM Administrator.tblMenu
			WHERE ModuleId = @ModuleId
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			MenuId
			FROM Administrator.tblMenu
			WHERE ModuleId = @ModuleId AND
			Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblMenu TO CenturiaUser
GO

