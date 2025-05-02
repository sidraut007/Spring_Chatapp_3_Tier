FROM maven:3.8.3-openjdk-17 as builder 

LABEL app=chatapp

WORKDIR /src

COPY . .

RUN mvn clean install -DskipTests

FROM openjdk:17-alpine as deployer

# Copy build from stage 1 (builder)
COPY --from=builder /src/target/*.jar /src/target/chatapp.jar

# Expose application port 
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "/src/target/chatapp.jar"]