FROM eclipse-temurin:17-alpine

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B

COPY src src

RUN ./mvnw clean package -DskipTests

# Create writable temp directories
RUN mkdir -p /app/tmp /app/tomcat && chmod -R 777 /app/tmp /app/tomcat

EXPOSE 8080

# Set temp directory and run
CMD ["java", "-Djava.io.tmpdir=/app/tmp", "-Dserver.tomcat.basedir=/app/tomcat", "-jar", "/app/target/vacation-backend-api-0.0.1-SNAPSHOT.jar"]