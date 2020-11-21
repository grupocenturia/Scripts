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

