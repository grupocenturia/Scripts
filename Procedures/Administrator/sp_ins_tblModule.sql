USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblModule') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblModule
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblModule
	(
	@Name varchar(100)
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
			SystemDate,
			Enabled
			)
			VALUES
			(
			@ModuleId,
			@Name,
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

