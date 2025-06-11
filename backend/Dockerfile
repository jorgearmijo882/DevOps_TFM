# Etapa de compilación
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app

# Copiamos pom y descargamos dependencias (cache)
COPY backend/pom.xml .
RUN mvn dependency:go-offline -B

# Copiamos el código y construimos el jar
COPY backend/src ./src
RUN mvn clean package -DskipTests -B

# Etapa de runtime
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copiamos el jar generado
COPY --from=build /app/target/*.jar app.jar

# Exponemos el puerto de Spring Boot
EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
