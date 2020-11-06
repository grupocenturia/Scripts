USE CNTDB00
GO

IF OBJECT_ID('Core.sp_upt_tblCountry') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_upt_tblCountry
END
GO

CREATE PROCEDURE Core.sp_upt_tblCountry
	(
	@CountryId int,
	@Name varchar(100),
	@IsoCode varchar(2),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Core.tblCountry SET
		Name = @Name,
		IsoCode = @IsoCode,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE CountryId  = @CountryId 
		
	SELECT @CountryId  AS CountryId 
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_upt_tblCountry TO CenturiaUser
GO

