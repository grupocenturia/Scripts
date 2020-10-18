USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblJournalStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblJournalStatus
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblJournalStatus
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON 
	
	DECLARE @JournalStatusId int
	
	BEGIN TRANSACTION
		SELECT @JournalStatusId = ISNULL(MAX(JournalStatusId), 0) + 1
			FROM Accounting.JournalStatus
			
		INSERT INTO Accounting.JournalStatus
			(
			JournalStatusId,
			Name,
			SytemDate,
			Enabled
			)
			VALUES
			(
			@JournalStatusId,
			@name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION 
	
	SELECT @JournalStatusId AS JournalStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblJournalStatus TO CenturiaUser
GO

