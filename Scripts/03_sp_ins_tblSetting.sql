USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblSetting 1, 'RUTA DE ACTUALIZACIONES', 'Ruta utilizada para obtener las actualizaciones del sistema', 'PathUpdate', 'C:\Centuria\Updates\'
EXECUTE Administrator.sp_ins_tblSetting 2, 'AUTENTICACION', 'Forma de autenticarse al sistema. 0-Autenticación Windows, 1-Usuario y contraseña', 'Authentication', '1'
EXECUTE Administrator.sp_ins_tblSetting 3, 'EXPIRACION DE CONTRASEÑA', 'Días de expiración de la contraseña. Este parámetro se activa si Authentication=1', 'PasswordExpiry', '30'
EXECUTE Administrator.sp_ins_tblSetting 3, 'AVISO DE EXPIRACION DE CONTRASEÑA', 'Días de aviso previo a la expiración de la contraseña. Este parámetro se activa si Authentication=1', 'PasswordAlert', '5'
GO

