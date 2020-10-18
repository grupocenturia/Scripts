USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblUser
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblUser
	(
	@UserId int,
	@Name varchar(100),
	@UserName varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Administrator.tblUser SET
		Name = @Name,
		UserName = @UserName,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE UserId = @UserId

	SELECT @UserId AS UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblUser TO CenturiaUser
GO

