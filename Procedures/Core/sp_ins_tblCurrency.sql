USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblCurrency') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_ins_tblCurrency
END
GO

CREATE PROCEDURE Core.sp_ins_tblCurrency
	(
	@Name varchar(100),
	@IsoCode varchar(3),
	@Symbol varchar(10)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @CurrencyId int
	
	BEGIN TRANSACTION
		SELECT @CurrencyId = ISNULL(MAX(@CurrencyId), 0) + 1
			FROM Core.tblCurrency
			
		INSERT INTO Core.tblCurrency
			(
			CurrencyId,
			Name,
			IsoCode,
			Symbol,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@CurrencyId,
			@Name,
			@IsoCode,
			@Symbol,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @CurrencyId AS CurrencyId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblCurrency TO CenturiaUser
GO

	