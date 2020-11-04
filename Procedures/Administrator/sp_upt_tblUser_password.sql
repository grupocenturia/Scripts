USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_upt_tblUser_password') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblUser_password
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblUser_password
	(
	@UserId int,
	@Password varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @CryptedPassword varbinary(MAX)

	OPEN SYMMETRIC KEY CenturiaKey
		DECRYPTION BY CERTIFICATE CenturiaCert

	SET @CryptedPassword = ENCRYPTBYKEY(KEY_GUID('CenturiaKey'), @Password)

	CLOSE SYMMETRIC KEY CenturiaKey


	UPDATE Administrator.tblUser SET
		Password = @CryptedPassword,
		SystemDate = GETDATE()
		WHERE UserId = @UserId

	SELECT @UserId AS UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblUser_password TO CenturiaUser
GO

