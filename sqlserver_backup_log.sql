USE [MYDATABASE]
GO
declare @fecha varchar(MAX)
declare @archivo varchar(MAX)
set @fecha = CONVERT(Varchar(max), GETDATE(),102)+'_'+SUBSTRING(CONVERT(varchar(10), getdate(),108),1,2)+SUBSTRING(CONVERT(varchar(10), getdate(),108),4,2)+'horas'
set @archivo =N'C:\FOLDER\MYDATABASE_LOG_'+@fecha+'.trn'
BACKUP LOG[MYDATABASE]
TO DISK = @archivo
   WITH FORMAT,
      MEDIANAME = 'D_SQLServerBackups',
      NAME = 'Log Database Backup';
GO