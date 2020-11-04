USE CNTDB00
GO

IF OBJECT_ID('Core.sp_ins_tblParameter') IS NOT NULL 
BEGIN
	DROP PROCEDURE Core.sp_ins_tblParameter
END
GO

CREATE PROCEDURE Core.sp_ins_tblParameter
	(
	@DataTypeId int,
	@Name varchar(100),
	@Length int,
	@Decimals int,
	@Format varchar(100)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @ParameterId int

	BEGIN TRANSACTION
		SELECT @ParameterId = ISNULL(MAX(ParameterId), 0) + 1
			FROM Core.tblParameter

		INSERT INTO Core.tblParameter
			(
			ParameterId,
			DataTypeId,
			Name,
			Length,
			Decimals,
			Format,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@ParameterId,
			@DataTypeId,
			@Name,
			@Length,
			@Decimals,
			@Format,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION

	SELECT @ParameterId AS ParameterId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_ins_tblParameter TO CenturiaUser
GO

