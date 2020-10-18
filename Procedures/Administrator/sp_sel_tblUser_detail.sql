USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_detail
	(
	@UserId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		UserName,
		Enabled
		FROM Administrator.tblUser
		WHERE UserId = @UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_detail TO CenturiaUser
GO

