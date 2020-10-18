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

