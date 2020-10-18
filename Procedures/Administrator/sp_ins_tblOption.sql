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

