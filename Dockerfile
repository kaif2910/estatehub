# 1. Build the Java project using Maven
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 2. Run the compiled project inside a Tomcat 10 Server
FROM tomcat:10.1-jdk17
# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy your built .war file to ROOT.war so it serves at the main domain (/)
COPY --from=build /app/target/EstateHub.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
