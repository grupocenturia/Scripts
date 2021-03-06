USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_del_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_del_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_del_tblProfileUser
	(
	@CompanyId int,
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM Administrator.tblProfileUser
		WHERE CompanyId = @CompanyId AND
		ProfileId = @ProfileId

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_del_tblProfileUser TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblAction') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblAction
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblAction
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @ActionId int
	
	BEGIN TRANSACTION
		SELECT @ActionId = ISNULL(MAX(ActionId), 0) + 1
			FROM Administrator.tblAction
		
		INSERT INTO Administrator.tblAction
			(
			ActionId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@ActionId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @ActionId AS ActionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblAction TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblCompany') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblCompany
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblCompany
	(
	@Name varchar(200),
	@TradeName varchar(100),
	@ShortName varchar(20),
	@DBName varchar(20)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @CompanyId int
	
	BEGIN TRANSACTION
		SELECT @CompanyId = ISNULL(MAX(CompanyId), 0) + 1
			FROM Administrator.tblCompany
			
		INSERT INTO Administrator.tblCompany
			(
			CompanyId,
			Name,
			TradeName,
			ShortName,
			DBName,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@CompanyId,
			@Name,
			@TradeName,
			@ShortName,
			@DBName,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @CompanyId AS CompanyId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblCompany TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblMenu') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblMenu
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblMenu
	(
	@ModuleId int,
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @MenuId int

	BEGIN TRANSACTION
		SELECT @MenuId = ISNULL(MAX(MenuId), 0) + 1
			FROM Administrator.tblMenu

		INSERT INTO Administrator.tblMenu
			(
			MenuId,
			ModuleId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@MenuId,
			@ModuleId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @MenuId AS MenuId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblMenu TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblModule
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblModule
	(
	@Name varchar(100),
	@Description varchar(MAX),
	@Executable varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @ModuleId int
	
	BEGIN TRANSACTION
		SELECT @ModuleId = ISNULL(MAX(ModuleId), 0) + 1
			FROM Administrator.tblModule
			
		INSERT INTO Administrator.tblModule
			(
			ModuleId,
			Name,
			Description,
			Executable,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@ModuleId,
			@Name,
			@Description,
			@Executable,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @ModuleId AS ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblModule TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblModuleLogo') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblModuleLogo
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblModuleLogo
	(
	@ModuleId int,
	@Logo varbinary(MAX)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	BEGIN TRANSACTION
		DELETE FROM Administrator.tblModuleLogo
			WHERE ModuleId = @ModuleId

		INSERT INTO Administrator.tblModuleLogo
			(
			ModuleId,
			Logo,
			SystemDate
			)
			VALUES
			(
			@ModuleId,
			@Logo,
			GETDATE()
			)
	COMMIT TRANSACTION

	SELECT @ModuleId AS ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblModuleLogo TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblOption') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblOption
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblOption
	(
	@MenuId int,
	@OptionTypeId int,
	@Name varchar(100),
	@OptionName varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @OptionId int

	BEGIN TRANSACTION
		SELECT @OptionId = ISNULL(MAX(OptionId), 0) + 1
			FROM Administrator.tblOption

		INSERT INTO Administrator.tblOption
			(
			OptionId,
			MenuId,
			OptionTypeId,
			Name,
			OptionName,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@OptionId,
			@MenuId,
			@OptionTypeId,
			@Name,
			@OptionName,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @OptionId AS OptionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblOption TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblOptionType') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblOptionType
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblOptionType
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @OptionTypeId int

	BEGIN TRANSACTION
		SELECT @OptionTypeId = ISNULL(MAX(OptionTypeId), 0) + 1
			FROM Administrator.tblOptionType

		INSERT INTO Administrator.tblOptionType
			(
			OptionTypeId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@OptionTypeId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @OptionTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblOptionType TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblProfile') IS NOT NULL 
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblProfile
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblProfile
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @ProfileId int

	BEGIN TRANSACTION
		SELECT @ProfileId = ISNULL(MAX(ProfileId), 0) + 1
			FROM Administrator.tblProfile

		INSERT INTO Administrator.tblProfile
			(
			ProfileId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@ProfileId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblProfile TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblProfileUser
	(
	@CompanyId int,
	@ProfileId int,
	@UserId int
	)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO Administrator.tblProfileUser
		(
		CompanyId,
		ProfileId,
		UserId,
		SystemDate
		)
		VALUES
		(
		@CompanyId,
		@ProfileId,
		@UserId,
		GETDATE()
		)

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblProfileUser TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblSetting') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblSetting
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblSetting
	(
	@ParameterId int,
	@Name varchar(100),
	@Description varchar(MAX),
	@Variable varchar(100),
	@Value varchar(MAX)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @SettingId int

	BEGIN TRANSACTION
		SELECT @SettingId = ISNULL(MAX(SettingId), 0) + 1
			FROM Administrator.tblSetting

		INSERT INTO Administrator.tblSetting
			(
			SettingId,
			ParameterId,
			Name,
			Description,
			Variable,
			Value,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@SettingId,
			@ParameterId,
			@Name,
			@Description,
			@Variable,
			@Value,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @SettingId AS SettingId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblSetting TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblStore') IS NOT NULL 
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblStore
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblStore
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @StoreId int

	BEGIN TRANSACTION
		SELECT @StoreId = ISNULL(MAX(StoreId), 0) + 1
			FROM Administrator.tblStore

		INSERT INTO Administrator.tblStore
			(
			StoreId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@StoreId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @StoreId AS StoreId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblStore TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblUser
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblUser
	(
	@Name varchar(100),
	@UserName varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @UserId int,
		@CryptedPassword varbinary(MAX),
		@PasswordExpiry int,
		@ExpirationDate date

	SELECT @PasswordExpiry = CASE WHEN ISNUMERIC(Value) = 0
			THEN 0
			ELSE CAST(Value AS int)
			END
		FROM Administrator.tblSetting
		WHERE Variable = 'PasswordExpiry'

	SET @PasswordExpiry = ISNULL(@PasswordExpiry, 0)

	IF @PasswordExpiry = 0
	BEGIN
		SET @ExpirationDate = GETDATE()
	END
	ELSE
	BEGIN
		SET @ExpirationDate = DATEADD(DAY, @PasswordExpiry, GETDATE())
	END

	OPEN SYMMETRIC KEY CenturiaKey
		DECRYPTION BY CERTIFICATE CenturiaCert

	SET @CryptedPassword = ENCRYPTBYKEY(KEY_GUID('CenturiaKey'), 'centuria')

	CLOSE SYMMETRIC KEY CenturiaKey

	BEGIN TRANSACTION
		SELECT @UserId = ISNULL(MAX(UserId), 0) + 1
			FROM Administrator.tblUser

		INSERT INTO Administrator.tblUser
			(
			UserId,
			Name,
			UserName,
			Password,
			ExpirationDate,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@UserId,
			@Name,
			@UserName,
			@CryptedPassword,
			@ExpirationDate,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @UserId AS UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblUser TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblAction') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblAction
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblAction
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
			ActionId
			FROM Administrator.tblAction
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			ActionId
			FROM Administrator.tblAction
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblAction TO CenturiaUser
GO

USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblAction_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblAction_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblAction_detail
	(
	@ActionId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblAction
		WHERE ActionId = @ActionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblAction_detail TO CenturiaUser
GO

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
		SELECT Name,
			TradeName,
			ShortName,
			DBName,
			Enabled,
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

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblCompany_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblCompany_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblCompany_detail
	(
	@CompanyId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		TradeName,
		ShortName,
		DBName,
		Enabled
		FROM Administrator.tblCompany
		WHERE CompanyId = @CompanyId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblCompany_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblMenu') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblMenu
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblMenu
	(
	@ModuleId int,
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN 
		SELECT Name,
			Enabled,
			MenuId
			FROM Administrator.tblMenu
			WHERE ModuleId = @ModuleId
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			MenuId
			FROM Administrator.tblMenu
			WHERE ModuleId = @ModuleId AND
			Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblMenu TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblMenu_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblMenu_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblMenu_detail
	(
	@MenuId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		Enabled,
		ModuleId
		FROM Administrator.tblMenu
		WHERE MenuId = @MenuId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblMenu_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblModule
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblModule
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN 
		SELECT Name,
			Description,
			Executable,
			Enabled,
			ModuleId
			FROM Administrator.tblModule
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			Description,
			Executable,
			ModuleId
			FROM Administrator.tblModule
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblModule TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblModuleLogo') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblModuleLogo
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblModuleLogo
	(
	@ModuleId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Logo
		FROM Administrator.tblModuleLogo
		WHERE ModuleId = @ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblModuleLogo TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblModule_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblModule_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblModule_detail
	(
	@ModuleId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Description,
		Executable,
		Enabled
		FROM Administrator.tblModule
		WHERE ModuleId = @ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblModule_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblOption') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOption
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOption
	(
	@MenuId int,
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN 
		SELECT tblOption.Name,
			tblOptionType.Name AS OptionType,
			tblOption.OptionName,
			tblOption.Enabled,
			tblOption.OptionId
			FROM Administrator.tblOption
			JOIN Administrator.tblOptionType ON
			tblOption.OptionTypeId = tblOptionType.OptionTypeId
			WHERE tblOption.MenuId = @MenuId AND
			tblOptionType.Enabled = 1
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			OptionId
			FROM Administrator.tblOption
			WHERE MenuId = @MenuId AND
			Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOption TO CenturiaUser
GO

USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblOptionType') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOptionType
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOptionType
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
			OptionTypeId
			FROM Administrator.tblOptionType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			OptionTypeId
			FROM Administrator.tblOptionType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOptionType TO CenturiaUser
GO

USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblOptionType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOptionType_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOptionType_detail
	(
	@OptionTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblOptionType
		WHERE OptionTypeId = @OptionTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOptionType_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblOption_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOption_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOption_detail
	(
	@OptionId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		Enabled,
		MenuId,
		OptionTypeId
		FROM Administrator.tblOption
		WHERE OptionId = @OptionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOption_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfile') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfile
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfile
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
			ProfileId
			FROM Administrator.tblProfile
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			ProfileId
			FROM Administrator.tblProfile
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfile TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfileUser
	(
	@CompanyId int,
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT CAST(Query1.Selected AS bit) AS Selected,
		tblUser.Name,
		Query1.UserId
		FROM
		(
		SELECT 1 AS Selected,
			UserId
			FROM Administrator.tblProfileUser
			WHERE CompanyId = @CompanyId AND
			ProfileId = @ProfileId
		UNION ALL
		SELECT 0,
			UserId
			FROM Administrator.tblUser
			WHERE UserId NOT IN
			(
			SELECT UserId
				FROM Administrator.tblProfileUser
				WHERE CompanyId = @CompanyId AND
				ProfileId = @ProfileId
			)
		) AS Query1
		JOIN Administrator.tblUser ON
		Query1.UserId = tblUser.UserId
		WHERE tblUser.Enabled = 1
		ORDER BY 1 DESC, 2
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfileUser TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfile_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfile_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfile_detail
	(
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblProfile
		WHERE ProfileId = @ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfile_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblSetting') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblSetting
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblSetting
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Description,
			Variable,
			Value,
			Enabled,
			SettingId,
			ParameterId
			FROM Administrator.tblSetting
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			Description,
			Variable,
			Value,
			SettingId,
			ParameterId
			FROM Administrator.tblSetting
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblSetting TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblStore') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblStore
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblStore
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
			StoreId
			FROM Administrator.tblStore
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			StoreId
			FROM Administrator.tblStore
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblStore TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblStore_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblStore_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblStore_detail
	(
	@StoreId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblStore
		WHERE StoreId = @StoreId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblStore_detail TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN
		SELECT Name AS [NOMBRE],
			UserName AS [USUARIO],
			ExpirationDate AS [EXPIRACION],
			Enabled AS [ACTIVO],
			UserId
			FROM Administrator.tblUser
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			UserName,
			ExpirationDate,
			UserId
			FROM Administrator.tblUser
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_check') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_check
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_check
(
	@UserName varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @UserId int,
		@Name varchar(100)

	SELECT @UserId = UserId,
		@Name = Name
		FROM Administrator.tblUser
		WHERE UserName = @UserName AND
		Enabled = 1

	SELECT ISNULL(@UserId, 0) AS UserId,
		ISNULL(@Name, '') AS Name,
		ISNULL(@UserName, '') AS UserName
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_check TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_checkPassword') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_checkPassword
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_checkPassword
(
	@UserName varchar(100),
	@Password varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @UserId int,
		@Name varchar(100),
		@ExpirationDate date

	OPEN SYMMETRIC KEY CenturiaKey
		DECRYPTION BY CERTIFICATE CenturiaCert

	SELECT @UserId = UserId,
		@Name = Name,
		@ExpirationDate = ExpirationDate
		FROM Administrator.tblUser
		WHERE UserName COLLATE Latin1_General_CS_AS = @UserName AND
		CAST(DECRYPTBYKEY([Password]) AS varchar) COLLATE Latin1_General_CS_AS = @Password AND
		Enabled = 1

	CLOSE SYMMETRIC KEY CenturiaKey

	SELECT ISNULL(@UserId, 0) AS UserId,
		ISNULL(@Name, '') AS Name,
		ISNULL(@UserName, '') AS UserName,
		ISNULL(@ExpirationDate, GETDATE()) AS ExpirationDate
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_checkPassword TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_company') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_company
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_company
	(
	@UserId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT DISTINCT
		tblCompany.Name,
		tblCompany.TradeName,
		tblCompany.ShortName,
		tblCompany.DBName,
		tblCompany.CompanyId
		FROM Administrator.tblProfileUser
		JOIN Administrator.tblCompany ON
		tblProfileUser.CompanyId = tblCompany.CompanyId
		JOIN Administrator.tblProfile ON
		tblProfileUser.ProfileId = tblProfile.ProfileId
		WHERE tblProfileUser.UserId = @UserId AND
		tblCompany.Enabled = 1 AND
		tblProfile.Enabled = 1
		ORDER BY 1
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_company TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_companyModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_companyModule
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_companyModule
	(
	@UserId int,
	@CompanyId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT DISTINCT
		tblModule.Name,
		tblModule.Description,
		tblModule.Executable,
		tblModule.ModuleId
		FROM Administrator.tblProfileUser
		JOIN Administrator.tblProfile ON
		tblProfileUser.ProfileId = tblProfile.ProfileId
		JOIN Administrator.tblProfileOption ON
		tblProfile.ProfileId = tblProfileOption.ProfileId
		JOIN Administrator.tblOption ON
		tblProfileOption.OptionId = tblOption.OptionId
		JOIN Administrator.tblMenu ON
		tblOption.MenuId = tblMenu.MenuId
		JOIN Administrator.tblModule ON
		tblMenu.ModuleId = tblModule.ModuleId
		WHERE tblProfileUser.UserId = @UserId AND
		tblProfileUser.CompanyId = @CompanyId AND
		tblProfile.Enabled = 1 AND
		tblOption.Enabled = 1 AND
		tblMenu.Enabled = 1 AND
		tblModule.Enabled = 1
		ORDER BY 1
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_companyModule TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_detail
	(
	@UserId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		UserName,
		Enabled
		FROM Administrator.tblUser
		WHERE UserId = @UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_detail TO CenturiaUser
GO

USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_upt_tblAction') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblAction
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblAction
	(
	@ActionId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblAction SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE ActionId = @ActionId
		
	SELECT @ActionId AS ActionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblAction TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblCompany') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblCompany
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblCompany
	(
	@CompanyId int,
	@Name varchar(200),
	@TradeName varchar(100),
	@ShortName varchar(20),
	@DBName varchar(20),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblCompany SET
		Name = @Name,
		TradeName = @TradeName,
		ShortName = @ShortName,
		DBName = @DBName,
		Enabled = @Enabled
		WHERE CompanyId = @CompanyId
		
	SELECT @CompanyId AS CompanyId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblCompany TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblMenu') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblMenu
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblMenu
	(
	@MenuId int,
	@ModuleId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Administrator.tblMenu SET
		ModuleId = @ModuleId,
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE MenuId = @MenuId

	SELECT @MenuId AS MenuId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblMenu TO Centuriauser
GO

USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_upt_tblModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblModule
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblModule
	(
	@ModuleId int,
	@Name varchar(100),
	@Description varchar(MAX),
	@Executable varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblModule SET
		Name = @Name,
		Description = @Description,
		Executable = @Executable,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE ModuleId = @ModuleId
		
	SELECT @ModuleId AS ModuleId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblModule TO Centuriauser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblOption') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblOption
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblOption
	(
	@OptionId int,
	@MenuId int,
	@OptionTypeId int,
	@Name varchar(100),
	@OptionName varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Administrator.tblOption SET
		MenuId = @MenuId,
		OptionTypeId = @OptionTypeId,
		Name = @Name,
		OptionName = @OptionName,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE OptionId = @OptionId

	SELECT @OptionId AS OptionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblOption TO Centuriauser
GO

USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_upt_tblOptionType') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblOptionType
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblOptionType
	(
	@OptionTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblOptionType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE OptionTypeId = @OptionTypeId
		
	SELECT @OptionTypeId AS OptionTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblOptionType TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblProfile') IS NOT NULL 
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblProfile
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblProfile
	(
	@ProfileId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblProfile SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE ProfileId = @ProfileId

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblProfile TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblStore') IS NOT NULL 
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblStore
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblStore
	(
	@StoreId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblStore SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE StoreId = @StoreId

	SELECT @StoreId AS StoreId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblStore TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblUser
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblUser
	(
	@UserId int,
	@Name varchar(100),
	@UserName varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Administrator.tblUser SET
		Name = @Name,
		UserName = @UserName,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE UserId = @UserId

	SELECT @UserId AS UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblUser TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblUser_password') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblUser_password
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblUser_password
	(
	@UserId int,
	@Password varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @CryptedPassword varbinary(MAX),
		@PasswordExpiry int,
		@ExpirationDate date

	SELECT @PasswordExpiry = CASE WHEN ISNUMERIC(Value) = 0
			THEN 0
			ELSE CAST(Value AS int)
			END
		FROM Administrator.tblSetting
		WHERE Variable = 'PasswordExpiry'

	SET @PasswordExpiry = ISNULL(@PasswordExpiry, 0)

	IF @PasswordExpiry = 0
	BEGIN
		SET @ExpirationDate = GETDATE()
	END
	ELSE
	BEGIN
		SET @ExpirationDate = DATEADD(DAY, @PasswordExpiry, GETDATE())
	END

	OPEN SYMMETRIC KEY CenturiaKey
		DECRYPTION BY CERTIFICATE CenturiaCert

	SET @CryptedPassword = ENCRYPTBYKEY(KEY_GUID('CenturiaKey'), @Password)

	CLOSE SYMMETRIC KEY CenturiaKey

	UPDATE Administrator.tblUser SET
		Password = @CryptedPassword,
		ExpirationDate = @ExpirationDate,
		SystemDate = GETDATE()
		WHERE UserId = @UserId

	SELECT @UserId AS UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblUser_password TO CenturiaUser
GO

