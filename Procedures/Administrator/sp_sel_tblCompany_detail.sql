USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblCompany_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblCompany_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblCompany_detail
	(
	@CompanyId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		TradeName,
		ShortName,
		DBName,
		Enabled
		FROM Administrator.tblCompany
		WHERE CompanyId = @CompanyId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblCompany_detail TO CenturiaUser
GO

