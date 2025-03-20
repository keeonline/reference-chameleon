FROM eclipse-temurin:23-jre-ubi9-minimal

COPY build/libs/chameleon-0.0.1-SNAPSHOT.jar /app/
EXPOSE 8080
EXPOSE 9080

ENTRYPOINT ["java","-jar","/app/chameleon-0.0.1-SNAPSHOT.jar"]

# NOTE: you need an account with Docker and to be logged in to pull the base image from dockerhub