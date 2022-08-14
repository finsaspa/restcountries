FROM maven:3-jdk-11
WORKDIR /src
COPY . .
RUN mvn -q package

FROM tomcat:9-jdk11
COPY --from=0 /src/target/restcountries-*.war /tmp/restcountries.war
CMD cp /tmp/restcountries.war $TOMCAT_HOME/webapps/ && catalina.sh run