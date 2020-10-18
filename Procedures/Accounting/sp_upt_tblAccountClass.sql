USE CNTDB01
GO 

IF OBJECT_ID('Accounting.sp_upt_tblAccountClass') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblAccountClass
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblAccountClass
	(
	@AccountClassId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblAccountClass SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE AccountClassId = @AccountClassId
		
	SELECT @AccountClassId AS AccountClassId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblAccountClass TO CenturiaUser
GO

