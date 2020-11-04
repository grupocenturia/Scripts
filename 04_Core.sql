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

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblDataType') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblDataType
END
GO

CREATE PROCEDURE Core.sp_sel_tblDataType
	(
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN
		SELECT Name,
			Enabled,
			DataTypeId
			FROM Core.tblDataType
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			DataTypeId
			FROM Core.tblDataType
			WHERE Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblDataType TO CenturiaUser
GO

USE CNTDB00
GO

IF OBJECT_ID('Core.sp_sel_tblDataType_detail') IS NOT NULL
BEGIN
	DROP PROCEDURE Core.sp_sel_tblDataType_detail
END
GO

CREATE PROCEDURE Core.sp_sel_tblDataType_detail
	(
	@DataTypeId int
	)
AS
BEGIN
	SET NOCOUNT ON

	SELECT Name,
		Enabled
		FROM Core.tblDataType
		WHERE DataTypeId = @DataTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Core.sp_sel_tblDataType_detail TO CenturiaUser
GO

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

