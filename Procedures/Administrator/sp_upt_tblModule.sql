USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_upt_tblModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblModule
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblModule
	(
	@ModuleId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblModule SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE ModuleId = @ModuleId
		
	SELECT @ModuleId AS ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblModule TO Centuriauser
GO

