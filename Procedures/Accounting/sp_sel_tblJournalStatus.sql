USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalStatus
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalStatus
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			JournalStatusId
			FROM Accounting.tblJournalStatus
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			JournalStatusId
			FROM Accounting.tblJournalStatus
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO
GRANT EXECUTE ON Accounting.sp_sel_tblJournalStatus TO CenturiaUser
GO

