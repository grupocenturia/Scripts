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

