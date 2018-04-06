# tomcat_setup
A customised setup of tomcat 8.5.29. Product is installed in /apps/tomcat along with a java jdk in /apps/java/jdk1.8.0_161

TOMCAT_HOME=/apps/tomcat/current
JAVA_HOME=/apps/java/jdsk1.8.0_161

I have used a tomcat user for stop/starting the application server. Variables have been declared in $TOMCAT_HOME/bin/setenv.sh

stop, start & restart is managed by $TOMCAT_HOME/tomcat.sh script

To test : http://localhost:8080/

