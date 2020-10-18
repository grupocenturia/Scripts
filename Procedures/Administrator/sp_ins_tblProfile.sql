USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblProfile') IS NOT NULL 
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblProfile
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblProfile
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @ProfileId int

	BEGIN TRANSACTION
		SELECT @ProfileId = ISNULL(MAX(ProfileId), 0) + 1
			FROM Administrator.tblProfile

		INSERT INTO Administrator.tblProfile
			(
			ProfileId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@ProfileId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @ProfileId AS ProfileId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblProfile TO CenturiaUser
GO

