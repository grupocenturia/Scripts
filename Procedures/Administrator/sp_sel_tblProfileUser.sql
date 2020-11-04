USE CNTDB00
GO

IF OBJECT_ID('Administrator.sp_sel_tblProfileUser') IS NOT NULL
BEGIN
	DROP PROCEDURE Administrator.sp_sel_tblProfileUser
END
GO

CREATE PROCEDURE Administrator.sp_sel_tblProfileUser
	(
	@CompanyId int,
	@ProfileId int
	)
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT CAST(Query1.Selected AS bit) AS Selected,
		tblUser.Name,
		Query1.UserId
		FROM
		(
		SELECT 1 AS Selected,
			UserId
			FROM Administrator.tblProfileUser
			WHERE CompanyId = @CompanyId AND
			ProfileId = @ProfileId
		UNION ALL
		SELECT 0,
			UserId
			FROM Administrator.tblUser
			WHERE UserId NOT IN
			(
			SELECT UserId
				FROM Administrator.tblProfileUser
				WHERE CompanyId = @CompanyId AND
				ProfileId = @ProfileId
			)
		) AS Query1
		JOIN Administrator.tblUser ON
		Query1.UserId = tblUser.UserId
		WHERE tblUser.Enabled = 1
		ORDER BY 1 DESC, 2
END

RETURN 0
GO

GRANT EXECUTE ON Administrator.sp_sel_tblProfileUser TO CenturiaUser
GO

