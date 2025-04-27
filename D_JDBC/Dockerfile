# Use OpenJDK 17 official image
FROM openjdk:17

# Set working directory
WORKDIR /app

# Copy source code
COPY ./src/main/java ./src/main/java

# Copy MySQL connector JAR
COPY ./src/main/webapp/WEB-INF/lib/mysql-connector-j-8.0.33.jar ./lib/mysql-connector-j-8.0.33.jar

# Compile Java file with external JAR (important part!)
RUN javac -cp lib/mysql-connector-j-8.0.33.jar src/main/java/com/om/Demo.java -d out

# Run the app with external JAR in classpath
CMD ["java", "-cp", "out:lib/mysql-connector-j-8.0.33.jar", "com.om.Demo"]
