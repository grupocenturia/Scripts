USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblProfileUser
	(
	@CompanyId int,
	@ProfileId int,
	@UserId int
	)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO Administrator.tblProfileUser
		(
		CompanyId,
		ProfileId,
		UserId,
		SystemDate
		)
		VALUES
		(
		@CompanyId,
		@ProfileId,
		@UserId,
		GETDATE()
		)

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblProfileUser TO CenturiaUser
GO

