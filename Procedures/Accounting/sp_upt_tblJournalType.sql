USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblJournalType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblJournalType
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblJournalType
	(
	@JournalTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblJournalType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE JournalTypeId = @JournalTypeId
		
	SELECT @JournalTypeId AS JournalTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblJournalType TO CenturiaUser
GO

