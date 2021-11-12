FROM adoptopenjdk/openjdk11-openj9:jdk-11.0.7_10_openj9-0.20.0-alpine AS build
COPY . /build
WORKDIR /build
RUN ./mvnw clean package

FROM adoptopenjdk/openjdk11-openj9:jre-11.0.7_10_openj9-0.20.0-alpine
WORKDIR /root/
COPY --from=build /build/target//kubetime-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/kubetime-0.0.1-SNAPSHOT.jar"]

USER 1005
