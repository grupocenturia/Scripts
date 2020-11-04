USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblDataType') IS NOT NULL 
BEGIN
	DROP PROCEDURE Core.sp_ins_tblDataType
END
GO

CREATE PROCEDURE Core.sp_ins_tblDataType
	(
	@Name varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @DataTypeId int

	BEGIN TRANSACTION
		SELECT @DataTypeId = ISNULL(MAX(DataTypeId), 0) + 1
			FROM Core.tblDataType

		INSERT INTO Core.tblDataType
			(
			DataTypeId,
			Name,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@DataTypeId,
			@Name,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @DataTypeId AS DataTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblDataType TO CenturiaUser
GO

