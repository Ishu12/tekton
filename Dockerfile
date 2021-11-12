FROM alpine/git


RUN echo "Docker build starts. "

RUN echo "maintained by : Abhiroop Ghatak => ghatak.20@gmail.com"

WORKDIR /app
RUN git clone https://github.com/abhiroopghatak/kubetime.git

#FROM maven:3.5-jdk-8-alpine
#WORKDIR /app
#COPY /app/kubetime /app
#RUN mvn install

FROM openjdk:8-jre-alpine
#WORKDIR /app
#COPY --from=builder /tmp/api-server /app/api-server
COPY --from=1 /app/target/kubetime-0.0.1-SNAPSHOT.jar /app
CMD java -jar target/kubetime-0.0.1-SNAPSHOT.jar



USER 1005
