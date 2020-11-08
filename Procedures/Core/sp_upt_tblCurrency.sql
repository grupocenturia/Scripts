USE CNTDB00
GO

IF OBJECT_ID('Core.sp_upt_tblCurrency') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_upt_tblCurrency
END
GO

CREATE PROCEDURE Core.sp_upt_tblCurrency
	(
	@CurrencyId int,
	@Name varchar(100),
	@IsoCode varchar(3),
	@Symbol varchar(10),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Core.tblCurrency SET
		Name = @Name,
		IsoCode = @IsoCode,
		Symbol = @Symbol,
		Enabled = @Enabled
		WHERE CurrencyId = @CurrencyId 
	
	SELECT @CurrencyId AS CurrencyId 
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_upt_tblCurrency TO CenturiaUser
GO

