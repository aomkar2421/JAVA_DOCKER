# Uses official OpenJDK 17 base image
FROM openjdk:17

# Set working directory
WORKDIR /app

# Copy project files into container
COPY ./src ./src

# Compile the Java source file and places all .class file in out directory
RUN javac src/om/Demo.java src/om/Student.java -d out

# Command to run your application sets classpath for .class file 
# as java assumes it is app/ by default to avoid issues "-cp", "out"
CMD ["java", "-cp", "out", "om.Demo"]
