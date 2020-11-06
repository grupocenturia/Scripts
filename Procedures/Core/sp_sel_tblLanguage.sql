USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblLanguage') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblLanguage
END
GO

CREATE PROCEDURE Core.sp_sel_tblLanguage
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			LanguageId
			FROM Core.tblLanguage
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			LanguageId
			FROM Core.tblLanguage
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblLanguage TO CenturiaUser
GO

