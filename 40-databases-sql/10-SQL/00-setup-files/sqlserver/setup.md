# Setup


**Microsoft® SQL Server® 2017 Express**

Microsoft® SQL Server® 2017 Express is a powerful and reliable free data management system that delivers a rich and reliable data store for lightweight Web Sites and desktop applications.

**SQL Server Management Studio (SSMS)**

SSMS is an integrated environment for managing any SQL infrastructure, from SQL Server to SQL Database. SSMS provides tools to configure, monitor, and administer instances of SQL. Use SSMS to deploy, monitor, and upgrade the data-tier components used by your applications, as well as build queries and scripts.

Use SQL Server Management Studio (SSMS) to query, design, and manage your databases and data warehouses, wherever they are - on your local computer, or in the cloud.

*Wide World Importers sample database v1.0*
Microsoft provides a sample database of a fictitious company Wide World Importers. 

- Download Microsoft® SQL Server® 2017 Express
- Install Microsoft® SQL Server® 2017 Express
-- enable mixed authentication mode (SQL server authentication and Windows authentication)
-- add Current user as SQL server administrator
- Download and install SSMS
- Open SSMS and Connect to your local Express database (Computer_name\SQLEXPRESS, windows authentication)
- Download the WideWorldImporters example database (WideWorldImporters-Full.bak )
- Restore the WideWorldImporters from the backup file
- Create a new Login (wwi_owner), and grant role membership db_owner to this login
- Create a new connection to the WideWorldImporter database using wwi_owner

https://docs.microsoft.com/nl-nl/sql/samples/wide-world-importers-what-is?view=sql-server-2017
https://github.com/Microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0

 
