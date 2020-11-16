USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_check') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_check
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_check
(
	@UserName varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @UserId int,
		@Name varchar(100)

	SELECT @UserId = UserId,
		@Name = Name
		FROM Administrator.tblUser
		WHERE UserName = @UserName AND
		Enabled = 1

	SELECT ISNULL(@UserId, 0) AS UserId,
		ISNULL(@Name, '') AS Name,
		ISNULL(@UserName, '') AS UserName
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_check TO CenturiaUser
GO

