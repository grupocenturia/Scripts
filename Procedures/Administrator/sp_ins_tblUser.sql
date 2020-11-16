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

	DECLARE @UserId int,
		@CryptedPassword varbinary(MAX),
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

	SET @CryptedPassword = ENCRYPTBYKEY(KEY_GUID('CenturiaKey'), 'centuria')

	CLOSE SYMMETRIC KEY CenturiaKey

	BEGIN TRANSACTION
		SELECT @UserId = ISNULL(MAX(UserId), 0) + 1
			FROM Administrator.tblUser

		INSERT INTO Administrator.tblUser
			(
			UserId,
			Name,
			UserName,
			Password,
			ExpirationDate,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@UserId,
			@Name,
			@UserName,
			@CryptedPassword,
			@ExpirationDate,
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

