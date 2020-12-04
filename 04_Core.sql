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

	USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblDataType') IS NOT NULL 
BEGIN
	DROP PROCEDURE Core.sp_ins_tblDataType
END
GO

CREATE PROCEDURE Core.sp_ins_tblDataType
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @DataTypeId int

	BEGIN TRANSACTION
		SELECT @DataTypeId = ISNULL(MAX(DataTypeId), 0) + 1
			FROM Core.tblDataType

		INSERT INTO Core.tblDataType
			(
			DataTypeId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@DataTypeId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @DataTypeId AS DataTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblDataType TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblLanguage') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_ins_tblLanguage
END
GO

CREATE PROCEDURE Core.sp_ins_tblLanguage
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @LanguageId int
	
	BEGIN TRANSACTION
		SELECT @LanguageId = ISNULL(MAX(LanguageId), 0) + 1
			FROM Core.tblLanguage
			
		INSERT INTO Core.tblLanguage
			(
			LanguageId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@LanguageId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @LanguageId AS LanguageId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblLanguage TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblParameter') IS NOT NULL 
BEGIN
	DROP PROCEDURE Core.sp_ins_tblParameter
END
GO

CREATE PROCEDURE Core.sp_ins_tblParameter
	(
	@DataTypeId int,
	@Name varchar(100),
	@Length int,
	@Decimals int,
	@Format varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @ParameterId int

	BEGIN TRANSACTION
		SELECT @ParameterId = ISNULL(MAX(ParameterId), 0) + 1
			FROM Core.tblParameter

		INSERT INTO Core.tblParameter
			(
			ParameterId,
			DataTypeId,
			Name,
			Length,
			Decimals,
			Format,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@ParameterId,
			@DataTypeId,
			@Name,
			@Length,
			@Decimals,
			@Format,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @ParameterId AS ParameterId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblParameter TO CenturiaUser
GO

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
	FROM Core.tblCountry
	WHERE CountryId = @CountryId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblCountry_detail TO CenturiaUser
GO

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

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblDataType') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblDataType
END
GO

CREATE PROCEDURE Core.sp_sel_tblDataType
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
			DataTypeId
			FROM Core.tblDataType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			DataTypeId
			FROM Core.tblDataType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblDataType TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblDataType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblDataType_detail
END
GO

CREATE PROCEDURE Core.sp_sel_tblDataType_detail
	(
	@DataTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		Enabled
		FROM Core.tblDataType
		WHERE DataTypeId = @DataTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblDataType_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblLanguage') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblLanguage
END
GO

CREATE PROCEDURE Core.sp_sel_tblLanguage
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
			LanguageId
			FROM Core.tblLanguage
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			LanguageId
			FROM Core.tblLanguage
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblLanguage TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblLanguage_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblLanguage_detail
END
GO

CREATE PROCEDURE Core.sp_sel_tblLanguage_detail
	(
	@LanguageId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
	Enabled
	FROM Core.tblLanguage
	WHERE LanguageId = @LanguageId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblLanguage_detail TO CenturiaUser
GO

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

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_upt_tblDataType') IS NOT NULL 
BEGIN
	DROP PROCEDURE Core.sp_upt_tblDataType
END
GO

CREATE PROCEDURE Core.sp_upt_tblDataType
	(
	@DataTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Core.tblDataType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE DataTypeId = @DataTypeId

	SELECT @DataTypeId AS DataTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_upt_tblDataType TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_upt_tblLanguage') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_upt_tblLanguage
END
GO

CREATE PROCEDURE Core.sp_upt_tblLanguage
	(
	@LanguageId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN	
	SET NOCOUNT ON
	
	UPDATE Core.tblLanguage SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE LanguageId = @LanguageId
		
	SELECT @LanguageId AS LanguageId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_upt_tblLanguage TO CenturiaUser
GO


