USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_del_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_del_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_del_tblProfileUser
	(
	@CompanyId int,
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM Administrator.tblProfileUser
		WHERE CompanyId = @CompanyId AND
		ProfileId = @ProfileId

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_del_tblProfileUser TO CenturiaUser
GO

