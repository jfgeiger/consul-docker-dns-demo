FROM harbor.k8s.opus2.com/library/openjdk:11-jdk-slim

ENV HOMEDIR="/greeter"
ENV JAR="greeter-receiver.jar"
RUN mkdir $HOMEDIR
COPY target/greeter-receiver-1.0-SNAPSHOT.jar $HOMEDIR/$JAR

ENTRYPOINT [ "sh", "-c", "java -jar $HOMEDIR/$JAR" ]

