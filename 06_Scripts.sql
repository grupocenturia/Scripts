USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblUser 'ADMINISTRADOR', 'usuario'
EXECUTE Administrator.sp_ins_tblUser 'DEMO', 'demo'
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblCompany 'GRUPO CENTURIA, S.A.', 'GRUPO CENTURIA', 'CENTURIA', 'CNTDB01'
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblModule 'ADMINISTRADOR'
EXECUTE Administrator.sp_ins_tblModule 'CONTABILIDAD'
GO

