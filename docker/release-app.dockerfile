FROM maven:3.6.3-jdk-11 AS build
COPY pom.xml /20_spring/
COPY src /20_spring/src/
WORKDIR /20_spring/
EXPOSE 8080
RUN mvn clean package


FROM tomcat:9.0.53-jdk11
COPY --from=build /20_spring/target/ROOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
