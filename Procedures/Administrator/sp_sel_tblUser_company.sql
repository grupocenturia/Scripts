USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_company') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_company
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_company
	(
	@UserId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT DISTINCT
		tblCompany.Name,
		tblCompany.TradeName,
		tblCompany.ShortName,
		tblCompany.DBName,
		tblCompany.CompanyId
		FROM Administrator.tblProfileUser
		JOIN Administrator.tblCompany ON
		tblProfileUser.CompanyId = tblCompany.CompanyId
		JOIN Administrator.tblProfile ON
		tblProfileUser.ProfileId = tblProfile.ProfileId
		WHERE tblProfileUser.UserId = @UserId AND
		tblCompany.Enabled = 1 AND
		tblProfile.Enabled = 1
		ORDER BY 1
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_company TO CenturiaUser
GO

