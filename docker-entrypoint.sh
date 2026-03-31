#!/bin/sh
# Render injects $PORT; Tomcat must listen on that port.
# Default to 8080 for local Docker usage.
PORT=${PORT:-8080}

sed -i "s/port=\"8080\"/port=\"${PORT}\"/" /usr/local/tomcat/conf/server.xml

exec catalina.sh run
