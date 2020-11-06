USE CNTDB00
GO

IF OBJECT_ID('Core.sp_upt_tblLanguage') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_upt_tblLanguage
END
GO

CREATE PROCEDURE Core.sp_upt_tblLanguage
	(
	@Languageid int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN	
	SET NOCOUNT ON
	
	UPDATE Core.blLanguage SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE Languageid = @Languageid
		
	SELECT @Languageid AS Languageid
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_upt_tblLanguage TO CenturiaUser
GO