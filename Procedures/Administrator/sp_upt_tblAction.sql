USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_upt_tblAction') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblAction
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblAction
	(
	@ActionId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblAction SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE ActionId = @ActionId
		
	SELECT @ActionId AS ActionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblAction TO CenturiaUser
GO

