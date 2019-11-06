# Setup

**Oracle SQL Developer**

SQL Developer is an Integrated development environment (IDE) for working with SQL in Oracle databases. Oracle Corporation provides this product free; it uses the Java Development Kit.

- Download and install Oracle SQL Developer

*OPTION 1: XE*

Oracle Database XE is an entry-level, small-footprint database based on the Oracle Database 11g Release 2 code base.  It's free to develop, deploy, and distribute; fast to download; and simple to administer.

- Download Oracle 11g XE database (you'll need an oracle account)
- Install the Oracle 11g XE database (user:SYSTEM password:SYSTEM)

Oracle Database XE comes with a sample database user named HR. 
This user owns several database tables in a sample schema for a fictional Human Resources department. 
However, for security reasons, this user's account is locked. 
You need to unlock this account before you can view the HR objects or build any applications that use these objects.*
- Create a new connection in SQL developer to your local Oracle XE using the SYSTEM user
- Unlock the HR user (can be found under Other Users)
- Disconnect the SYSTEM user
- Create a new connection using the HR user

*Tip!* Oracle Database Express Edition Getting Started Guide

*OPTION 2: Amazon Relational Database Service (RDS)*

We've created an oracle database on Amazon Web Services. For each user we've created a seperate user HRSTUDENTX  and HRSTUDENTX schema. 

- Create a new connection in SQL developer to the AWS cloud environment
    - Hostname: database.cuvv0osxzgmi.eu-west-3.rds.amazonaws.com
    - port: 1521
    - SID: admin
    - username: HRSTUDENTX
    - password: HRSTUDENTX
    
