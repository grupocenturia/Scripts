USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblAccountType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblAccountType
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblAccountType
	(
	@AccountTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblAccountType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE AccountTypeId = @AccountTypeId
		
	SELECT @AccountTypeId AS AccountTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblAccountType TO CenturiaUser
GO

