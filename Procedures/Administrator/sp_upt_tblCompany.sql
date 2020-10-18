USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblCompany') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblCompany
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblCompany
	(
	@CompanyId int,
	@Name varchar(200),
	@TradeName varchar(100),
	@ShortName varchar(20),
	@DBName varchar(20),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblCompany SET
		Name = @Name,
		TradeName = @TradeName,
		ShortName = @ShortName,
		DBName = @DBName,
		Enabled = @Enabled
		WHERE CompanyId = @CompanyId
		
	SELECT @CompanyId AS CompanyId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblCompany TO CenturiaUser
GO

