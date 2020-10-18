USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalType_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalType_detail
	(
	@JournalTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Accounting.tblJournalType
		WHERE JournalTypeId = @JournalTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblJournalType_detail TO CenturiaUser
GO

