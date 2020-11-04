USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfileUser
	(
	@UserId int,
	@CompanyId int,
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
		SELECT tblUser.Name AS "User",
			tblProfile.Name AS Profile,
			tblCompany.Name AS Company,
			tblProfileUser.ProfileId
			FROM Administrator.tblProfileUser
			LEFT JOIN Administrator.tblUser ON
			tblProfileUser.UserId = tblUser.UserId
			RIGHT JOIN Administrator.tblProfile ON
			tblProfileUser.ProfileId = tblProfile.ProfileId
			JOIN Administrator.tblCompany ON
			tblProfileUser.CompanyId = tblCompany.CompanyId
			WHERE tblUser.UserId = @UserId AND
			tblCompany.CompanyId = @CompanyId AND
			tblProfile.ProfileId = @ProfileId
			ORDER BY 1
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfileUser TO CenturiaUser
GO

