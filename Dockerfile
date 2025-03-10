FROM eclipse-temurin:23-jre-ubi9-minimal
# FROM quebec-base:latest

# RUN mkdir /app
COPY build/libs/quebec-0.0.1-SNAPSHOT.jar /app/
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/quebec-0.0.1-SNAPSHOT.jar"]

# NOTE: you need an account with Docker and to be logged in to pull the base image from dockerhub