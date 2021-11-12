FROM openjdk:16-alpine3.13

WORKDIR /app

RUN git clone https://github.com/Ishu12/tekton.git
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

CMD java -jar kubetime/target/kubetime-0.0.1-SNAPSHOT.jar

USER 1005
