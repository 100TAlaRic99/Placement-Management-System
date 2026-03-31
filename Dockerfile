FROM tomcat:9.0

# Remove default ROOT webapp to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy web application files directly (JSPs are pre-compiled on first request)
COPY web/ /usr/local/tomcat/webapps/ROOT/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Render injects $PORT at runtime; default is 8080 for local use
EXPOSE 8080

CMD ["/docker-entrypoint.sh"]