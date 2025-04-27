FROM openjdk:17-slim

# Install find utility and bash
RUN apt-get update && apt-get install -y findutils

WORKDIR /app

COPY ./src ./src

# below will give error as shell inside Docker (which is based on Linux) 
# doesn't support wildcard expansion 
# RUN javac src/com/**/*.java -d out

# Compile all .java files safely
RUN find src -name "*.java" > sources.txt && javac @sources.txt -d out	

# Run the app
CMD ["java", "-cp", "out", "om.Demo"]
