USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblCurrency_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblCurrency_detail
END
GO

CREATE PROCEDURE Core.sp_sel_tblCurrency_detail
	(
	@CurrencyId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
	Enabled,
	IsoCode,
	Symbol
	FROM Core.tblCurrency
	WHERE CurrencyId  = @CurrencyId 
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblCurrency_detail TO CenturiaUser
GO

