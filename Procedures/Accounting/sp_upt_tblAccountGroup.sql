USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblAccountGroup') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblAccountGroup
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblAccountGroup
	(
	@AccountGroupId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblAccountGroup SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE AccountGroupId = @AccountGroupId
		
	SELECT @AccountGroupId AS AccountGroupId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblAccountGroup TO CenturiaUser
GO

