**Disclaimer**

Both analysis and software development are not a hard science. 
Below you can find a possible solution for the stated problem.
Different interpretations of the requirements can result in different valid solutions. 


# Context Diagram

For the context diagram we consider the entire Financial Risk System and all internal components as a blackbox.
We will only focus on the ingoing and outgoing interactions with users or external systems.

![Context Diagram](financial_risk_system_context_solution.pdf)    

## Users

### Business user

In the functional requirements a group of business users is mentioned as those that consume the risk report on a daily base.

### Administrator

Tough not mentioned explicitly the requirements mention that a subset of the business user should be able to configure external parameters. Let's introduce the concept of 'Adminstrators'.

## External systems

### Trade Data system (TDS)

We will import the information on trades in our financial risk system. The trade information will be communicated in the form of an XML file.
    
### Reference Data System (RDS)

We will import the counterparties from the RDS. The counterparties will be imported in the form of an XML file.

### LDAP/Active directory (desired, not mandatory)

In order to verify that only authorized users can access the implementation we introduced LDAP/Active directory as authentication method.
    
### Central Monitoring Service
    
Fatal errors and in case of the report not being generated information should be sent to the Central Monitoring service.



# Container diagram

For the container diagram we zoom into the Financial Risk System and focus on the different containers and their interactions.
We still depict our users and external systems but now it becomes clear with which containers they are interacting.
 
## Frontend application

The frontend application allows the business users to view the report and the Administrators to make configuration changes.
The frontend application is an angular application serving HTML, CSS and JS over HTTPS. 

## Backend application

The backend application is responsible for joining and enriching the data. It will do the risk calculation and generate the report.
The backend application itself is setup as a spring, JPA application.  

The backend application will provide rest endpoints that can be called by the frontend app.

The backend application will communicate with the TDS and RDS using Rest/JSON

It is also the backend app that will communicate with the active directory  service using the LDAP protocol to make sure users are authenticated.

Alerts and report notifications are also initiated by the backend application

##  Report file system

In our solution we introduced a file server to store the reports. The communication between the backend application and file servers uses FTP (file transfer protocol).

## relational database

The database will story the enriched data and calculated risk date. Also audit information can be stored in our database.
In our solution a mySQL database is introduced with communication from the backend using JPQL (Java Persistence Query Language).

![Container Diagram](financial_risk_system_container_solution.pdf)  

# Component diagram

For the component diagram we further zoom into the Financial Risk System backend application and define the different components. In short, a component is a grouping of related functionality (encapsulated behind a well-defined interface). 

## TradeDataSystemConnector (Spring, Java)

The component responsible for pulling info from the TDS

## ReferenceDataSystemConnector (Spring, Java)

The component responsible for pulling info from the RDS

## The RiskCalculationComponent (Spring, Java)

The component that receives the data, enriches it and does the risk calculation

## ReportGeneratorComponent (Spring, Java, XLS)

The component that actually will generate the report

## MicroExcelReportFacade (XLS library)

Component to generate the XLS report, used by the eportGeneratorComponent.

## FileSystemFacade
Used to store and retrieve the report from the file server

## ReportController (Spring webservices, JAX-RS, Rest)
The component that provides the REST endpoints to the frontend app to view the risk report

## MailComponent
The component that interacts wit the external mail system

## SecurityComponent (Spring security)
Component responsible for authentication of the users. Communicates with the Active directory services.

## ParamController (Jax-RS, Rest)
Component responsible for managing and viewing the configuration parameters

## ParamComponent
Component that will manage the parameters and stores them into our mySQL database

## AuditComponent
The audit Component will capture logs from the reportGeneratorComponent and stores them into our database


![Component Diagram](financial_risk_system_component_solution.pdf)   
























 







    
    
  
