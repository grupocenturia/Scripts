USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblLanguage_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblLanguage_detail
END
GO

CREATE PROCEDURE Core.sp_sel_tblLanguage_detail
	(
	@LanguageId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
	Enabled
	FROM Core.tblLanguage
	WHERE LanguageId = @LanguageId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblLanguage_detail TO CenturiaUser
GO

