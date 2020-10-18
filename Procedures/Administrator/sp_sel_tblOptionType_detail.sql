USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblOptionType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOptionType_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOptionType_detail
	(
	@OptionTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblOptionType
		WHERE OptionTypeId = @OptionTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOptionType_detail TO CenturiaUser
GO

