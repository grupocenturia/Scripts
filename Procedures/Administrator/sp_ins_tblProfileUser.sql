USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblProfileUser
	(
	@UserId int,
	@CompanyId int
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @ProfileId int
	
	BEGIN TRANSACTION
		SELECT @ProfileId = ISNULL(MAX(ProfileId), 0) + 1
			FROM Administrator.tblProfileUser
			
		INSERT INTO Administrator.tblProfileUser
			(
			ProfileId,
			UserId,
			CompanyId,
			SystemDate
			)
			VALUES
			(
			@ProfileId,
			@UserId,
			@CompanyId,
			GETDATE()
			)
	COMMIT TRANSACTION
	
	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblProfileUser TO CenturiaUser
GO

