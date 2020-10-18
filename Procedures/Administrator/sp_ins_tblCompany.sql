USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_ins_tblCompany') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_ins_tblCompany
END
GO

CREATE PROCEDURE Administrator.sp_ins_tblCompany
	(
	@Name varchar(200),
	@TradeName varchar(100),
	@ShortName varchar(20),
	@DBName varchar(20)
	)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @CompanyId int
	
	BEGIN TRANSACTION
		SELECT @CompanyId = ISNULL(MAX(CompanyId), 0) + 1
			FROM Administrator.tblCompany
			
		INSERT INTO Administrator.tblCompany
			(
			CompanyId,
			Name,
			TradeName,
			ShortName,
			DBName,
			SystemDate,
			Enabled
			)
			VALUES
			(
			@CompanyId,
			@Name,
			@TradeName,
			@ShortName,
			@DBName,
			GETDATE(),
			1
			)
	COMMIT TRANSACTION
	
	SELECT @CompanyId AS CompanyId
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_ins_tblCompany TO CenturiaUser
GO

