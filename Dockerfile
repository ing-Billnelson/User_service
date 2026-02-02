# Base Java 17
FROM eclipse-temurin:17-jdk-alpine

# Créer le dossier de l'application
WORKDIR /app

# Copier les fichiers Maven et source depuis la racine
COPY pom.xml ./ 
COPY src ./src
COPY mvnw ./
COPY .mvn ./.mvn

# Rendre le Maven Wrapper exécutable
RUN chmod +x mvnw

# Build l'application
RUN ./mvnw clean package -DskipTests

# Exposer le port
EXPOSE 8084

# Lancer le JAR
CMD ["java", "-jar", "target/user-service-0.0.1-SNAPSHOT.jar"]

