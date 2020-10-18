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

