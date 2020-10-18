USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblOption') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblOption
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblOption
	(
	@MenuId int,
	@Enabled bit
	)
AS
BEGIN
	SET NOCOUNT ON

	IF @Enabled = 0
	BEGIN 
		SELECT tblOption.Name,
			tblOptionType.Name AS OptionType,
			tblOption.OptionName,
			tblOption.Enabled,
			tblOption.OptionId
			FROM Administrator.tblOption
			JOIN Administrator.tblOptionType ON
			tblOption.OptionTypeId = tblOptionType.OptionTypeId
			WHERE tblOption.MenuId = @MenuId AND
			tblOptionType.Enabled = 1
			ORDER BY 1
	END
	ELSE
	BEGIN
		SELECT Name,
			OptionId
			FROM Administrator.tblOption
			WHERE MenuId = @MenuId AND
			Enabled = 1
			ORDER BY 1
	END
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblOption TO CenturiaUser
GO

