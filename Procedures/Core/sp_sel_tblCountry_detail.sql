USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblCountry_detail') IS NOT NULL
BEGIN 
	DROP PROCEDURE Core.sp_sel_tblCountry_detail
END
GO

CREATE PROCEDURE Core.sp_sel_tblCountry_detail
	(
	@CountryId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
	IsoCode,
	Enabled
	FROM Core.tblCountry_detail
	WHERE CountryId = @CountryId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblCountry_detail TO CenturiaUser
GO

