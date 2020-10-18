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

