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

