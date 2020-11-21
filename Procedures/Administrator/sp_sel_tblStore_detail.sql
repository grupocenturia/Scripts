USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblStore_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblStore_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblStore_detail
	(
	@StoreId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblStore
		WHERE StoreId = @StoreId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblStore_detail TO CenturiaUser
GO

