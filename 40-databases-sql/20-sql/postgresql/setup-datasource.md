# PostgreSQL datasource Setup

**Database Starter**

In order to make the codelabs, we need a database with the necessary content. You will have two options to get this. The local setup enables you to create your own database server, but is a bit harder to set up. The remote setup 
uses a prefab Postgres database we have provided through Amazon Web Services. There is no better choice here, in future projects at Switchfully you will be setting up your own remote database through Heroku anyway. The choice is yours, but
remember that admin rights might spoil the fun of a local setup. AWS is your fastest and easiest solution.

**Local setup**
- [ ] Download and install pgAdmin
- [ ] Run pgAdmin and add a new server
- [ ] Connect your local database to IntelliJ by adding it as a datasource and providing the necessary details (see below)
- [ ] Run the sql scripts we provided to populate your database with the right content (inspect the scripts, which one would we need to run first? Which one should we ignore for the time being?)
- [ ] If the previous steps were successful, you should be able to solve the codelabs

**Remote database through Amazon Web Services (AWS)**
- [ ] ~~Download and install pgAdmin~~
- [ ] Connect the AWS database to IntelliJ by adding it as a datasource and providing the necessary details (see below)
- [ ] ~~Run the sql scripts we provided to populate your database with the right content (inspect the scripts, which one would we need to run first? Which one should we ignore for the time being?)~~
- [ ] If the previous step was successful, you should be able to solve the codelabs

**Configuration info**

*Local installation*
- Host: localhost
- Port: 5432
- Username: postgres (or any username you manually provided)
- Password: <yourownpassword>

*AWS*

- Host: database-2.cuvv0osxzgmi.eu-west-3.rds.amazonaws.com
- Port: 5432
- Username: student
- Password: spidermanismyhero
- Schemas tab: Make sure to select the Switchfully schemas

You can find the setup files `40-databases-sql/20-sql/postgresql/setup-files-postgres`
