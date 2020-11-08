USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblCurrency')IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblCurrency
END
GO

CREATE PROCEDURE Core.sp_sel_tblCurrency
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			IsoCode,
			Symbol,
			Enabled,
			CurrencyId
			FROM Core.tblCurrency
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			CurrencyId,
			IsoCode,
			Symbol
			FROM Core.tblCurrency
			WHERE Enabled= 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblCurrency TO CenturiaUser
GO

