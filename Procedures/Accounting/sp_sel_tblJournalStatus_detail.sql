USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalStatus_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalStatus_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalStatus_detail
	(
	@JournalStatusId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Accounting.tblJournalStatus
		WHERE JournalStatusId = @JournalStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblJournalStatus_detail TO CenturiaUser
GO

