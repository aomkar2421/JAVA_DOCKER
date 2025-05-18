# FROM openjdk:17-slim

# WORKDIR /app

# COPY ./src ./src

# # below will give error as shell inside Docker (which is based on Linux) 
# # doesn't support wildcard expansion 
# # RUN javac src/com/**/*.java -d out

# # Compile all .java files safely
# #below both are correct

# # RUN find src -name "*.java" > sources.txt && javac @sources.txt -d out	
# RUN javac -d out $(find src -name "*.java")

# # Run the app
# CMD ["java", "-cp", "out", "om.Demo"]






# above file produces image of size 642 mb hence i am going with 
# multi stage docker build

# Stage 1: Build using full JDK
FROM openjdk:17-slim AS build

WORKDIR /app

COPY . .

RUN find src -name "*.java" > sources.txt && javac @sources.txt -d out	

# Stage 2: Use minimal JRE to run
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=build /app/out ./out
# COPY – Copies files from another stage.
# --from=build – Says: take from the build stage (Stage 1).
# /app/out – Source path from Stage 1 (compiled class files).
# ./out – Destination inside current container's /app directory.

CMD ["java", "-cp", "out", "om.Demo"]