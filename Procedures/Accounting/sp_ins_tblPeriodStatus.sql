USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_ins_tblPeriodStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_ins_tblPeriodStatus
END
GO

CREATE PROCEDURE Accounting.sp_ins_tblPeriodStatus
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @PeriodStatusId int
	
	BEGIN TRANSACTION
		SELECT @PeriodStatusId = ISNULL(MAX(PeriodStatusId), 0) + 1
			FROM Accounting.tblPeriodStatus
			
		INSERT INTO Accounting.tblPeriodStatus
			(
			PeriodStatusId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@PeriodStatusId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @PeriodStatusId AS PeriodStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_ins_tblPeriodStatus TO CenturiaUser
GO

