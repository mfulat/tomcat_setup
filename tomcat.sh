#!/bin/bash

# This assumes tomcat is installed in $CATALINA_HOME
export CATALINA_HOME=/apps/tomcat/current
export JAVA_HOME=/apps/java/jdk1.8.0_161
process_name=current

state() { if [ `ps auxw|grep $process_name|grep -v grep|wc -l` -gt 0 ]
then
    running=true
else
    running=false
fi
}

case "$1" in
start)

        state
        if [ $running = "false" ]
        then 
		$CATALINA_HOME/bin/startup.sh 2>&1 > /dev/null
                echo Tomcat has started.
        fi
	;;
stop)
	state
        if [ $running = "true" ]
        then
	    $CATALINA_HOME/bin/shutdown.sh 2>&1 > /dev/null
            echo Tomcat has been shutdown.
        fi
	;;
restart)
	state
        if [ $running = "false" ]
        then
	    $CATALINA_HOME/bin/startup.sh 2>&1 > /dev/null
            echo Tomcat has started.
        else
	    $CATALINA_HOME/bin/shutdown.sh 2>&1 > /dev/null
	    $CATALINA_HOME/bin/startup.sh 2>&1 > /dev/null
            echo "Tomcat has been restarted"
        fi
	;;
status)
	state
        if [ $running = "false" ]
        then
                echo Tomcat is not running.
        else
                echo Tomcat is running.
        fi
	;;
*)
echo "Usage: tomcat start|stop|restart|stateus"
esac
