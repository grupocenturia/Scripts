USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfile_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfile_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfile_detail
	(
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblProfile
		WHERE ProfileId = @ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfile_detail TO CenturiaUser
GO

