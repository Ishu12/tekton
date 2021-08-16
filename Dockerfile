FROM alpine/git

WORKDIR /app
RUN git clone https://github.com/abhiroopghatak/kubetime.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/kubetime /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/kubetime-0.0.1-SNAPSHOT.jar /app
CMD java -jar kubetime-0.0.1-SNAPSHOT.jar



USER 1005