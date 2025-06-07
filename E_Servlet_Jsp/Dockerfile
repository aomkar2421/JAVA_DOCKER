# FROM tomcat:10.1.20-jdk17-temurin

# # Remove default ROOT app (optional)
# # RUN rm -rf /usr/local/tomcat/webapps/ROOT

# # Copy your WAR file to Tomcat's webapps directory
# COPY E_Servlet_Jsp.war /usr/local/tomcat/webapps/ROOT.war

# EXPOSE 8080



# # Stage 1: Build stage (you can skip this if WAR is already created)
# FROM openjdk:17-slim AS builder

# # Optional: Copy your source code and build tools
# WORKDIR /app
# COPY . /app

# # If you have a script or Ant command to build WAR, run it here
# # RUN ./build.sh or ant or mvn package if applicable

# # For this example, assume WAR is already in the project root:
# # /app/E_Servlet_Jsp.war


# # Stage 2: Final minimal runtime image
# FROM tomcat:10.1.20-jre17-temurin

# # Clean up default webapps (optional but helps size)
# RUN rm -rf /usr/local/tomcat/webapps/* \
#     && rm -rf /usr/local/tomcat/logs/* \
#     && rm -rf /usr/local/tomcat/temp/*

# # Copy WAR file from build stage
# COPY --from=builder /app/E_Servlet_Jsp.war /usr/local/tomcat/webapps/ROOT.war

# EXPOSE 8080


# Multi-stage build for distroless
FROM tomcat:10.1.20-jdk17-temurin AS tomcat-base

# Build stage - prepare Tomcat
FROM tomcat-base AS builder
RUN rm -rf /usr/local/tomcat/webapps/*
COPY E_Servlet_Jsp.war /usr/local/tomcat/webapps/ROOT.war

# Final distroless stage
FROM gcr.io/distroless/java17-debian12
COPY --from=builder /usr/local/tomcat /usr/local/tomcat
COPY --from=builder /usr/local/tomcat/webapps/ROOT.war /usr/local/tomcat/webapps/ROOT.war

ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME
EXPOSE 8080

# Distroless doesn't have shell, so we need to use the java command directly
ENTRYPOINT ["java", "-Djava.util.logging.config.file=/usr/local/tomcat/conf/logging.properties", "-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager", "-Djdk.tls.ephemeralDHKeySize=2048", "-Djava.protocol.handler.pkgs=org.apache.catalina.webresources", "-Dorg.apache.catalina.security.SecurityListener.UMASK=0027", "-Dignore.endorsed.dirs=", "-classpath", "/usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar", "-Dcatalina.base=/usr/local/tomcat", "-Dcatalina.home=/usr/local/tomcat", "-Djava.io.tmpdir=/usr/local/tomcat/temp", "org.apache.catalina.startup.Bootstrap", "start"]