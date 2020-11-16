USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_companyModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_companyModule
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_companyModule
	(
	@UserId int,
	@CompanyId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT DISTINCT
		tblModule.Name,
		tblModule.Description,
		tblModule.Executable,
		tblModule.ModuleId
		FROM Administrator.tblProfileUser
		JOIN Administrator.tblProfile ON
		tblProfileUser.ProfileId = tblProfile.ProfileId
		JOIN Administrator.tblProfileOption ON
		tblProfile.ProfileId = tblProfileOption.ProfileId
		JOIN Administrator.tblOption ON
		tblProfileOption.OptionId = tblOption.OptionId
		JOIN Administrator.tblMenu ON
		tblOption.MenuId = tblMenu.MenuId
		JOIN Administrator.tblModule ON
		tblMenu.ModuleId = tblModule.ModuleId
		WHERE tblProfileUser.UserId = @UserId AND
		tblProfileUser.CompanyId = @CompanyId AND
		tblProfile.Enabled = 1 AND
		tblOption.Enabled = 1 AND
		tblMenu.Enabled = 1 AND
		tblModule.Enabled = 1
		ORDER BY 1
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_companyModule TO CenturiaUser
GO

