FROM eclipse-temurin:17-alpine

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B

COPY src src

RUN ./mvnw clean package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "/app/target/vacation-backend-api-0.0.1-SNAPSHOT.jar"]