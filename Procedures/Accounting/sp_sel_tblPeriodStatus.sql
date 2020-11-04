USE CNTDB01
GO

IF OBJECT_ID('Accounting.sp_sel_tblPeriodStatus') IS NOT NULL
BEGIN
	DROP PROCEDURE Accounting.sp_sel_tblPeriodStatus
END
GO

CREATE PROCEDURE Accounting.sp_sel_tblPeriodStatus
	(
	@enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			PeriodStatusId
			FROM Accounting.tblPeriodStatus
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			PeriodStatusId
			FROM Accounting.tblPeriodStatus
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Accounting.sp_sel_tblPeriodStatus TO CenturiaUser
GO

