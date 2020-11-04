USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_upt_tblPeriodStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_upt_tblPeriodStatus
END
GO

CREATE PROCEDURE Accounting.sp_upt_tblPeriodStatus
	(
	@PeriodStatusId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Accounting.tblPeriodStatus SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE PeriodStatusId = @PeriodStatusId
		
	SELECT @PeriodStatusId AS PeriodStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_upt_tblPeriodStatus TO CenturiaUser
GO

