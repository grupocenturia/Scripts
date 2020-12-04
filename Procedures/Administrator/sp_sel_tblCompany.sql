USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblCompany') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblCompany
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblCompany
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name AS [NOMBRE DE COMPAÑIA],
			TradeName AS [NOMBRE COMERCIAL],
			ShortName AS [NOMBRE CORTO],
			DBName AS [BASE DE DATOS],
			Enabled AS [ACTIVO],
			CompanyId
			FROM Administrator.tblCompany
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			TradeName,
			ShortName,
			DBName,
			CompanyId
			FROM Administrator.tblCompany
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblCompany TO CenturiaUser
GO

