FROM confluentinc/cp-kafka-connect-base

COPY ./plugins/ /usr/share/java/

USER root
RUN microdnf install ca-certificates gzip jq wget tar -y && microdnf clean all;

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.12/binaries/apache-maven-3.9.12-bin.tar.gz
RUN tar -xvf apache-maven-3.9.12-bin.tar.gz
RUN apache-maven-3.9.12/bin/mvn org.apache.maven.plugins:maven-dependency-plugin:3.6.0:copy \
    -Dartifact=io.prometheus.jmx:jmx_prometheus_javaagent:LATEST \
    -DoutputDirectory=/opt \
    -Dmdep.useBaseVersion=true
RUN mv /opt/jmx_prometheus_javaagent-1.0.1.jar /opt/prometheus_agent.jar

USER appuser
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:14.1.1
