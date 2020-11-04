USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblPeriodStatus_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblPeriodStatus_detail
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblPeriodStatus_detail
	(
	@PeriodStatusId int
	)
AS
BEGIN
	SET NOCOUNT ON 
	
	SELECT Name,
		Enabled
		FROM Accounting.tblPeriodStatus
		WHERE PeriodStatusId = @PeriodStatusId
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblPeriodStatus_detail TO CenturiaUser
GO

