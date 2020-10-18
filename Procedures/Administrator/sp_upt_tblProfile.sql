USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblProfile') IS NOT NULL 
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblProfile
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblProfile
	(
	@ProfileId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblProfile SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE ProfileId = @ProfileId

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblProfile TO CenturiaUser
GO

