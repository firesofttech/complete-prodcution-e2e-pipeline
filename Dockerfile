FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:17.0.6_10-jdk
WORKDIR /app
RUN rm -rf /app/*
COPY --from=build /app/target/complete-prodcution-e2e-pipeline-1.0-SNAPSHOT.jar /app/
EXPOSE 8080
CMD ["java", "-jar"," complete-prodcution-e2e-pipeline-1.0-SNAPSHOT.jar"]
