USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblMenu') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblMenu
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblMenu
	(
	@MenuId int,
	@ModuleId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Administrator.tblMenu SET
		ModuleId = @ModuleId,
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE MenuId = @MenuId

	SELECT @MenuId AS MenuId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblMenu TO Centuriauser
GO

