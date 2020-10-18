USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_sel_tblAction_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblAction_detail
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblAction_detail
	(
	@ActionId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT Name,
		Enabled
		FROM Administrator.tblAction
		WHERE ActionId = @ActionId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblAction_detail TO CenturiaUser
GO

