USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfileUser_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfileUser_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfileUser_detail
	(
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT UserId,
		CompanyId
		FROM Administrator.tblProfileUser
		WHERE ProfileId = @ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfileUser_detail TO CenturiaUser
GO

