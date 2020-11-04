USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblDataType') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblDataType
END
GO

CREATE PROCEDURE Core.sp_sel_tblDataType
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
			DataTypeId
			FROM Core.tblDataType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			DataTypeId
			FROM Core.tblDataType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblDataType TO CenturiaUser
GO

