RESTORE DATABASE [WideWorldImporters] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Backup\WideWorldImporters-Full.bak'
 WITH  FILE = 1 , 
  MOVE N'WWI_Primary' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WideWorldImporters.mdf',  
  MOVE N'WWI_UserData' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WideWorldImporters_UserData.ndf',  
  MOVE N'WWI_Log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WideWorldImporters.ldf',  
  MOVE N'WWI_InMemory_Data_1' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WideWorldImporters_InMemory_Data_1',  
  NOUNLOAD,  STATS = 5


CREATE LOGIN [wwi_owner] WITH PASSWORD='password', 
DEFAULT_DATABASE=[WideWorldImporters], 
DEFAULT_LANGUAGE=[us_english], 
CHECK_EXPIRATION=OFF,
CHECK_POLICY=OFF

GO


USE [WideWorldImporters]
CREATE USER [wwi_owner] FOR LOGIN [wwi_owner]
ALTER ROLE [db_owner] ADD MEMBER [wwi_owner]
GO


/*
Drop login, drop connections, drop database
*/
DROP LOGIN [wwi_owner]
ALTER DATABASE [WideWorldImporters] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE [WideWorldImporters] 
GO
