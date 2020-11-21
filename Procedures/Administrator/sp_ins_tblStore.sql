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

