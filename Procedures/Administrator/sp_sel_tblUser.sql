USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblUser
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblUser
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN
		SELECT Name AS [NOMBRE],
			UserName AS [USUARIO],
			ExpirationDate AS [EXPIRACION],
			Enabled AS [ACTIVO],
			UserId
			FROM Administrator.tblUser
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			UserName,
			ExpirationDate,
			UserId
			FROM Administrator.tblUser
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblUser TO CenturiaUser
GO

