FROM maven:3-jdk-11
WORKDIR /app
COPY . .
RUN mvn -q package

FROM quay.io/wildfly/wildfly
WORKDIR /app
COPY --from=0 /app/target/restcountries-*.war /opt/jboss/wildfly/standalone/deployments/restcountries.war
