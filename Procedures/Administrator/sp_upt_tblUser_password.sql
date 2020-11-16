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

	DECLARE @CryptedPassword varbinary(MAX),
		@PasswordExpiry int,
		@ExpirationDate date

	SELECT @PasswordExpiry = CASE WHEN ISNUMERIC(Value) = 0
			THEN 0
			ELSE CAST(Value AS int)
			END
		FROM Administrator.tblSetting
		WHERE Variable = 'PasswordExpiry'

	SET @PasswordExpiry = ISNULL(@PasswordExpiry, 0)

	IF @PasswordExpiry = 0
	BEGIN
		SET @ExpirationDate = GETDATE()
	END
	ELSE
	BEGIN
		SET @ExpirationDate = DATEADD(DAY, @PasswordExpiry, GETDATE())
	END

	OPEN SYMMETRIC KEY CenturiaKey
		DECRYPTION BY CERTIFICATE CenturiaCert

	SET @CryptedPassword = ENCRYPTBYKEY(KEY_GUID('CenturiaKey'), @Password)

	CLOSE SYMMETRIC KEY CenturiaKey

	UPDATE Administrator.tblUser SET
		Password = @CryptedPassword,
		ExpirationDate = @ExpirationDate,
		SystemDate = GETDATE()
		WHERE UserId = @UserId

	SELECT @UserId AS UserId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblUser_password TO CenturiaUser
GO

