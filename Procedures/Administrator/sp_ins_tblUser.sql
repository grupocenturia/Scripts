USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblUser
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblUser
	(
	@Name varchar(100),
	@UserName varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @UserId int

	BEGIN TRANSACTION
		SELECT @UserId = ISNULL(MAX(UserId), 0) + 1
			FROM Administrator.tblUser

		INSERT INTO Administrator.tblUser
			(
			UserId,
			Name,
			UserName,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@UserId,
			@Name,
			@UserName,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @UserId AS UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblUser TO CenturiaUser
GO
