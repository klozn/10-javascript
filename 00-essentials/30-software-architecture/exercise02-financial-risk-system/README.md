# A financial risk system

From [Simon Brown - Software Architecture for developers](https://www.codingthearchitecture.com)

1. Create the **Context diagram** for the financial risk system
2. Create the **Container diagram** for the financial risk system
3. (Create the **Component diagram**, e.g. for the financial risk system backend application)

### Background

A global investment bank based in London, New York and Singapore trades (buys and sells) financial products with other banks (counterparties). When share prices on the stock markets move up or down, the bank either makes money or loses it. At the end of the working day, the bank needs to gain a view of how much risk they are exposed to (e.g. of losing money) by running some calculations on the data held about their trades. The bank has an existing Trade Data System (TDS) and Reference Data System (RDS) but need a new Risk System. 

### Trade system

The Trade Data System maintains a store of all trades made by the bank. It is already configured to generate a file-based XML export of trade data at the close of business (5pm) in New York. 
The export includes the following information for every trade made by the bank: 
- Trade ID 
- Date 
- Current trade value in US dollars 
- Counterparty ID 

### Reference data system

The Reference Data System maintains all of the reference data needed by the bank. This includes information about counterparties; each of which represents an individual, a bank, etc. A file-based XML export is also available and includes basic information about each counterparty. A new organisation-wide reference data system is due for completion in the next 3 months, with the current system eventually being decommissioned.

## Requirements

### Functional requirements

The high-level functional requirements for the new Risk System are as follows.

1.	Import trade data from the Trade Data System.
2.	Import counterparty data from the Reference Data System.
3.	Join the two sets of data together, enriching the trade data with information about the counterparty.
4.	For each counterparty, calculate the risk that the bank is exposed to.
5.	Generate a report that can be imported into Microsoft Excel containing the risk figures for all counterparties known by the bank.
6.	Distribute the report to the business users before the start of the next trading day (9am) in Singapore.
7.	Provide a way for a subset of the business users to configure and maintain the external parameters used by the risk calculations.

### Non functional requirements

The non-functional requirements for the new Risk System are as follows.

**Performance**
- Risk reports must be generated before 9am the following business day in Singapore.

**Scalability**
- The system must be able to cope with trade volumes for the next 5 years.
- The Trade Data System export includes approximately 5000 trades now and it is anticipated that there will be an additional 10 trades per day.
- The Reference Data System counterparty export includes approximately 20,000 coun¬terparties and growth will be negligible.
- There are 40-50 business users around the world that need access to the report.

**Availability**
- Risk reports should be available to users 24x7, but a small amount of downtime (less than 30 minutes per day) can be tolerated.
 
**Failover**
- Manual failover is sufficient for all system components, provided that the availability targets can be met.

**Security**
- This system must follow bank policy that states system access is restricted to authen¬ticated and authorised users only.
- Reports must only be distributed to authorised users.
- Only a subset of the authorised users are permitted to modify the parameters used in the risk calculations.
- Although desirable, there are no single sign-on requirements (e.g. integration with Active Directory, LDAP, etc).
- All access to the system and reports will be within the confines of the bank's global network.

**Audit**
- The following events must be recorded in the system audit logs:
    1. Report generation.
    2. Modification of risk calculation parameters.
- It must be possible to understand the input data that was used in calculating risk.

**Fault Tolerance and Resilience**
- The system should take appropriate steps to recover from an error if possible, but all errors should be logged.
- Errors preventing a counterparty risk calculation being completed should be logged and the process should continue.

**Internationalization and Localization**
- All user interfaces will be presented in English only.
- All reports will be presented in English only.
- All trading values and risk figures will be presented in US dollars only.

**Monitoring and Management**
- A Simple Network Management Protocol (SNMP) trap should be sent to the bank's Central Monitoring Service in the following circumstances:
- When there is a fatal error with a system component.
- When reports have not been generated before 9am Singapore time.

**Data Retention and Archiving**
- Input files used in the risk calculation process must be retained for 1 year.

**Interoperability**
- Interfaces with existing data systems should conform to and use existing data formats.
