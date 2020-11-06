USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblSetting 1, 'RUTA DE ACTUALIZACIONES', 'Ruta utilizada para obtener las actualizaciones del sistema', 'PathUpdate', 'C:\Centuria\Updates\'
EXECUTE Administrator.sp_ins_tblSetting 2, 'AUTENTICACION', 'Forma de autenticarse al sistema. 0-Autenticación Windows, 1-Usuario y contraseña', 'Authentication', '0'
GO

