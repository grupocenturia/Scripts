USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblJournalType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblJournalType
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblJournalType
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
			JournalTypeId
			FROM Accounting.tblJournalType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			JournalTypeId
			FROM Accounting.tblJournalType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblJournalType TO CenturiaUser
GO

