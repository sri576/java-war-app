FROM openjdk:8
EXPOSE 8080
ADD  target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war 
ENTRYPOINT ["java", "-jdk", "/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war"]
