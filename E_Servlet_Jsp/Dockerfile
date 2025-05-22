FROM tomcat:10.1.20-jdk17-temurin

# Remove default ROOT app (optional)
# RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file to Tomcat's webapps directory
COPY E_Servlet_Jsp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080