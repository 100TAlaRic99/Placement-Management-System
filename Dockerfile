FROM tomcat:9.0

# Remove default ROOT webapp to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Download MySQL JDBC driver
RUN apt-get update && apt-get install -y wget && \
    wget -O /usr/local/tomcat/lib/mysql-connector-java-8.0.33.jar \
    https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy web application files
COPY web/ /usr/local/tomcat/webapps/ROOT/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Render injects $PORT at runtime; default is 8080 for local use
EXPOSE 8080

CMD ["/docker-entrypoint.sh"]