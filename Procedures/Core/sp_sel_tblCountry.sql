USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblCountry') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblCountry
END
GO

CREATE PROCEDURE Core.sp_sel_tblCountry
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			IsoCode,
			CountryId
			FROM Core.tblCountry
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			IsoCode,
			CountryId
			FROM Core.tblCountry
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblCountry TO CenturiaUser
GO

