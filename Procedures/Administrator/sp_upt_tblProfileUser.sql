USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblProfileUser
	(
	@ProfilId int,
	@UserId int,
	@CompanyId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblProfileUser SET
		UserId = @UserId,
		CompanyId = @CompanyId,
		SystemDate = GETDATE()
		WHERE ProfilId = @ProfilId
	
	SELECT @ProfilId AS ProfilId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblProfileUser TO CenturiaUser
GO

