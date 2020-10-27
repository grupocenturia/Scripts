USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblUser 'ADMINISTRADOR', 'usuario', 'centuria'
EXECUTE Administrator.sp_ins_tblUser 'DEMO', 'demo', 'centuria'
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

