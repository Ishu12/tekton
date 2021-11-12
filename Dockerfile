FROM alpine/git
RUN mkdir /app
WORKDIR /app
COPY . /app
#RUN git clone https://github.com/abhiroopghatak/kubetime.git

FROM openjdk:8-jre-alpine
WORKDIR /app
#COPY --from=1 /app/target/kubetime-0.0.1-SNAPSHOT.jar /app
#CMD java -jar target/kubetime-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "target/kubetime-0.0.1-SNAPSHOT.jar"]



