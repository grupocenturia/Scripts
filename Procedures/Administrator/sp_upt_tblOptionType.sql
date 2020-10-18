USE CNTDB00
GO 

IF OBJECT_ID('Administrator.sp_upt_tblOptionType') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_upt_tblOptionType
END
GO

CREATE PROCEDURE Administrator.sp_upt_tblOptionType
	(
	@OptionTypeId int,
	@Name varchar(100),
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE Administrator.tblOptionType SET
		Name = @Name,
		SystemDate = GETDATE(),
		Enabled = @Enabled
		WHERE OptionTypeId = @OptionTypeId
		
	SELECT @OptionTypeId AS OptionTypeId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_upt_tblOptionType TO CenturiaUser
GO

