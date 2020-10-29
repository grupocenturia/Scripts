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

USE CNTDB00
GO

EXECUTE Core.sp_ins_tblDataType 'ENTERO'
EXECUTE Core.sp_ins_tblDataType 'NUMERO'
EXECUTE Core.sp_ins_tblDataType 'TEXTO'
EXECUTE Core.sp_ins_tblDataType 'FECHA'
EXECUTE Core.sp_ins_tblDataType 'LOGICO'
GO

USE CNTDB00
GO

EXECUTE Core.sp_ins_tblParameter 3, 'TEXTO 200', 200, 0, ''
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblSetting 1, 'RUTA DE ACTUALIZACIONES', 'Ruta utilizada para obtener las actualizaciones del sistema', 'PathUpdate', 'C:\Centuria\Updates\'
GO

