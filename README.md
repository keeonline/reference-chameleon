# quebec

## Private URLs

http://localhost:8080/private/quebec/actuator/health   
http://localhost:8080/private/quebec/actuator/info  


## Public URLs

http://localhost:8080/public/quebec/greetings   
http://localhost:8080/public/quebec/users

## Docker Image

The docker build pulls the base image openjdk:22-jdk-slim from Docker Hub. You need to have a Docker account and be logged in to do this.

The command to build the image, executed from the root of the project is:

`docker build -t quebec:latest .`

The command to run a container from your local image is:

`docker run -p 8080:8080 quebec:latest`

Note that this will run the image interactively and you can stop it by hittin CTRL+C in the execution window.


## NEXT STEPS

add GH for docker build and publish