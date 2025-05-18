# # Uses official OpenJDK 17 base image
# FROM openjdk:17-slim

# # Set working directory
# WORKDIR /app

# # Copy project files into container
# COPY . .

# # Compile the Java source file and places all .class file in out directory
# RUN javac src/om/Demo.java -d out

# # Command to run your application sets classpath for .class file 
# # as java assumes it is app/ by default to avoid issues "-cp", "out"
# CMD ["java", "-cp", "out", "om.Demo"]


# #here we have to options for RUN & CMD above and below in above compiled files
# #are stored in out folder hence in CMD we r givinf classpath(-cp) as out
# #but if we use RUN javac src/om/Demo.java the compiled files will be in src
# # in this case we have to givr classpath for src folder

# # RUN javac src/om/Demo.java 
# # CMD ["java", "-cp", "src", "om.Demo"]


# above file produces image of size 642 mb hence i am going with 
# multi stage docker build

# Stage 1: Build using full JDK
FROM openjdk:17-slim AS build

WORKDIR /app

COPY . .

RUN javac src/om/Demo.java -d out

# Stage 2: Use minimal JRE to run
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=build /app/out ./out
# COPY – Copies files from another stage.
# --from=build – Says: take from the build stage (Stage 1).
# /app/out – Source path from Stage 1 (compiled class files).
# ./out – Destination inside current container's /app directory.

CMD ["java", "-cp", "out", "om.Demo"]