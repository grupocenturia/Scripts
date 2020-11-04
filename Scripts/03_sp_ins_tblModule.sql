USE CNTDB00
GO

EXECUTE Administrator.sp_ins_tblModule 'ADMINISTRADOR', 'Configuración general del sistema, usuarios, roles y permisos', 'Administrator.exe'
EXECUTE Administrator.sp_ins_tblModule 'CONTABILIDAD', 'Partidas contables, generación de balances y estados de resultado', 'Accounting.exe'
GO

