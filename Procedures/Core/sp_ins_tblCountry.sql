USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblCountry')IS NOT NULL 
BEGIN
	DROP PROCEDURE Core.sp_ins_tblCountry
END
GO

CREATE PROCEDURE Core.sp_ins_tblCountry
	(
	@Name varchar(100),
	@IsoCode varchar(2)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @CountryId int
	
	BEGIN TRANSACTION
		SELECT @CountryId = ISNULL(MAX(CountryId), 0) + 1
			FROM Core.tblCountry
			
		INSERT INTO Core.tblCountry
			(
			CountryId ,
			Name,
			IsoCode,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@CountryId,
			@Name,
			@IsoCode,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @CountryId  AS CountryId 
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblCountry TO CenturiaUser
GO	

