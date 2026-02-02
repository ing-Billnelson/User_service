# Stage 1: Build avec Maven
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copier les fichiers Maven
COPY pom.xml ./
COPY mvnw ./
COPY .mvn ./.mvn

# Rendre Maven Wrapper exécutable
RUN chmod +x mvnw

# Télécharger les dépendances (mise en cache)
RUN ./mvnw dependency:go-offline -B

# Copier le code source
COPY src ./src

# Build l'application
RUN ./mvnw clean package -DskipTests

# Stage 2: Runtime avec JRE (plus léger)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copier seulement le JAR depuis le stage de build
COPY --from=build /app/target/*.jar app.jar

# Exposer le port (Render utilisera la variable PORT)
EXPOSE 8080

# Lancer l'application
# Utilise la variable PORT de Render si disponible, sinon 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
