USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblJournalType') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblJournalType
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblJournalType
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @JournalTypeId int
	
	BEGIN TRANSACTION
		SELECT @JournalTypeId = ISNULL(MAX(JournalTypeId), 0) + 1
			FROM Acounting.tblJournalType
			
		INSERT INTO Acounting.tblJournalType
			(
			JournalTypeId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@JournalTypeId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @JournalTypeId AS JournalTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblJournalType TO CenturiaUser
GO

