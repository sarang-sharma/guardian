FROM openjdk:17-jdk-slim

WORKDIR /app
COPY target/guardian/guardian.jar guardian.jar
EXPOSE 8080

CMD java -Dlogback.configurationFile=${LOGBACK_FILE} -jar guardian.jar