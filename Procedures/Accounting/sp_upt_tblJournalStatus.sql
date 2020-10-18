USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblJournalStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblJournalStatus
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblJournalStatus
	(
	@JournalStatusId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblJournalStatus SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE JournalStatusId = @JournalStatusId
		
	SELECT @JournalStatusId AS JournalStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblJournalStatus TO CenturiaUser
GO

