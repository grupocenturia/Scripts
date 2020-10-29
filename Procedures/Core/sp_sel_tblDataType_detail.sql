USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblDataType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblDataType_detail
END
GO

CREATE PROCEDURE Core.sp_sel_tblDataType_detail
	(
	@DataTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		Enabled
		FROM Core.tblDataType
		WHERE DataTypeId = @DataTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblDataType_detail TO CenturiaUser
GO

