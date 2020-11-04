USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser_checkPassword') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser_checkPassword
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser_checkPassword
(
	@UserName varchar(100),
	@Password varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @UserId int,
		@Name varchar(100)

	OPEN SYMMETRIC KEY CenturiaKey
		DECRYPTION BY CERTIFICATE CenturiaCert

	SELECT @UserId = UserId,
		@Name = Name 
		FROM Administrator.tblUser
		WHERE UserName COLLATE Latin1_General_CS_AS = @UserName AND
		CAST(DECRYPTBYKEY([Password]) AS varchar) COLLATE Latin1_General_CS_AS = @Password AND
		Enabled = 1

	CLOSE SYMMETRIC KEY CenturiaKey

	SELECT ISNULL(@UserId, 0) AS UserId,
		ISNULL(@Name, '') AS Name
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser_checkPassword TO CenturiaUser
GO

