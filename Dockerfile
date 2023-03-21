FROM maven:3.9.0-eclipse-temurin-19 AS builder

ADD ./pom.xml pom.xml
ADD ./src src/

RUN mvn clean package

FROM eclipse-temurin:19-alpine as runtime

COPY --from=builder target/my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]