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
EXECUTE Core.sp_ins_tblParameter 5, 'LOGICO', 0, 0, ''
EXECUTE Core.sp_ins_tblParameter 1, 'ENTERO', 0, 0, ''
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblSetting 1, 'RUTA DE ACTUALIZACIONES', 'Ruta utilizada para obtener las actualizaciones del sistema', 'PathUpdate', 'C:\Centuria\Updates\'
EXECUTE Administrator.sp_ins_tblSetting 2, 'AUTENTICACION', 'Forma de autenticarse al sistema. 0-Autenticación Windows, 1-Usuario y contraseña', 'Authentication', '1'
EXECUTE Administrator.sp_ins_tblSetting 3, 'EXPIRACION DE CONTRASEÑA', 'Días de expiración de la contraseña. Este parámetro se activa si Authentication=1', 'PasswordExpiry', '30'
EXECUTE Administrator.sp_ins_tblSetting 3, 'AVISO DE EXPIRACION DE CONTRASEÑA', 'Días de aviso previo a la expiración de la contraseña. Este parámetro se activa si Authentication=1', 'PasswordAlert', '5'
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblUser 'ADMINISTRADOR', 'usuario'
EXECUTE Administrator.sp_ins_tblUser 'DEMO', 'demo'
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblCompany 'GRUPO CENTURIA, S.A. DE C.V.', 'GRUPO CENTURIA', 'CENTURIA', 'CNTDB01'
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblModule 'ADMINISTRADOR', 'Configuración general del sistema, usuarios, roles y permisos', 'Administrator.exe'
EXECUTE Administrator.sp_ins_tblModule 'CONTABILIDAD', 'Partidas contables, generación de balances y estados de resultado', 'Accounting.exe'
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblProfile 'ADMINISTRADOR'
GO

USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblProfileUser 1, 1, 1
GO

