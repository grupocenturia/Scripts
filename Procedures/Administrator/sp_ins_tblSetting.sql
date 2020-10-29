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

