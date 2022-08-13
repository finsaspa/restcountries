FROM maven:3-jdk-11
WORKDIR /src
COPY . .
RUN mvn -q package

FROM quay.io/wildfly/wildfly
COPY --from=0 /src/target/restcountries-*.war /opt/jboss/wildfly/standalone/deployments/restcountries.war
