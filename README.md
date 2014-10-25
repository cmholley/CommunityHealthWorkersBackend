CommunityHealthWorker Backend
==========

Collection of RESTful web service implementation for Community Health Worker App functions. 

The source code is developed as Eclipse Maven project using facets "Dynamic Web Project" and "Java". The backend provides a RESTful web service vie Jersey. The security is handled by Spring. We are using Tomcat as servlet container.

Tested with versions:
Jersey 2.9
JDK 1.7
Tomcat 7.0

This project is a clone of the VolunteerManagementBackend and uses ACL as described [there](https://github.com/DataAnalyticsinStudentHands/VolunteerManagementBackend) .


Instruction
===========

1. Import the CHWApp.sql file included in the mysql directory. This includes all necessary tables for user management and acl.

2. Change src/resources/webapp/META-INF/context.xml to connect to the database.




