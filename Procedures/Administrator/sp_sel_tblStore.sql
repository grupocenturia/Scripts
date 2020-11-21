USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblStore') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblStore
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblStore
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			StoreId
			FROM Administrator.tblStore
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			StoreId
			FROM Administrator.tblStore
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblStore TO CenturiaUser
GO

