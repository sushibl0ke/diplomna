# Thesis Project - CiVi

**Introduction:**

Web-based CV builder including a locally hosted Apache Tomcat server and a MySQL database used to store user cridentials and saved autobiographies.

Requires Java, Apache Tomcat and a connection to MySQL Server (using JDBC).
Further details are specified in bulgarianDocumentation.pdf (Bulgarian Only).

**Setup:**

Apache Tomcat, MySQL and JDK are all included in the archive (no need for any installation on the side of the user)
Included in the release archive are a couple of .cmd file used to automate the process of starting the Tomcat and MySQL servers.

mysql_start.cmd -
```
@echo off
set PATH=mysql-8.0.27-winx64\bin;%PATH%
mysqld --console --user=root --init-file=YOUR_PATH\\java\\init.txt

pause
```
tomcat_start.cmd - 
```
@echo off
set JAVA_HOME=%CD%\JDK64
set PATH=%JAVA_HOME%\bin;%PATH%

set CATALINA_HOME=%CD%\apache-tomcat-10.0.14
%CATALINA_HOME%\bin\startup.bat
set CLASSPATH=%CATALINA_HOME%\common\lib\jsp-api.jar;%CLASSPATH%
```
The MySQL server .cmd file points to a init.txt file present in the root directory of the project.
This is the only file (mysql_start.cmd) that will need to be edited by the user as per their project folder directory.
