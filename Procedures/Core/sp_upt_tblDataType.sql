USE CNTDB00
GO

IF OBJECT_ID('Core.sp_upt_tblDataType') IS NOT NULL 
BEGIN
	DROP PROCEDURE Core.sp_upt_tblDataType
END
GO

CREATE PROCEDURE Core.sp_upt_tblDataType
	(
	@DataTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Core.tblDataType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE DataTypeId = @DataTypeId

	SELECT @DataTypeId AS DataTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_upt_tblDataType TO CenturiaUser
GO

