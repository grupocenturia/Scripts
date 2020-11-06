USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblLanguage') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_ins_tblLanguage
END
GO

CREATE PROCEDURE Core.sp_ins_tblLanguage
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @LanguageId int
	
	BEGIN TRANSACTION
		SELECT @LanguageId = ISNULL(MAX(LanguageId), 0) + 1
			FROM Core.tblLanguage
			
		INSERT INTO Core.tblLanguage
			(
			LanguageId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@LanguageId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @LanguageId AS LanguageId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblLanguage TO CenturiaUser
GO

