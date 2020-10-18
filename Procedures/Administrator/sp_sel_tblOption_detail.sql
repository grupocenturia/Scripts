USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblOption_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOption_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOption_detail
	(
	@OptionId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		Enabled,
		MenuId,
		OptionTypeId
		FROM Administrator.tblOption
		WHERE OptionId = @OptionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOption_detail TO CenturiaUser
GO

