FROM eclipse-temurin:23-jre-ubi9-minimal

ARG VERSION="unknown"

COPY build/libs/chameleon-${VERSION}.jar /opt/app.jar

LABEL org.opencontainers.image.version=${VERSION}

EXPOSE 8080
EXPOSE 9080

ENTRYPOINT ["java","-jar","/opt/app.jar"]

# NOTE: you need an account with Docker and to be logged in to pull the base image from dockerhub