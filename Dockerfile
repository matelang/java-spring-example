FROM maven:3.9.0-eclipse-temurin-19 AS builder

ADD ./pom.xml pom.xml
ADD ./src src/

RUN mvn clean package
RUN mv target/example-*-SNAPSHOT.jar target/app.jar

FROM eclipse-temurin:19-alpine as runtime

COPY --from=builder target/app.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]