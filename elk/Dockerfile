FROM confluentinc/cp-kafka-connect-base
MAINTAINER Jens Van Deynse [corilus.be]

USER root
RUN yum install jq -y

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
RUN tar -xvf apache-maven-3.9.9-bin.tar.gz
RUN apache-maven-3.9.9/bin/mvn org.apache.maven.plugins:maven-dependency-plugin:3.6.0:copy \
    -Dartifact=io.prometheus.jmx:jmx_prometheus_javaagent:LATEST \
    -DoutputDirectory=/opt \
    -Dmdep.useBaseVersion=true
RUN mv /opt/jmx_prometheus_javaagent-1.0.1.jar /opt/prometheus_agent.jar

USER appuser
RUN confluent-hub install --no-prompt org.elasticsearch:elasticsearch-kafka-connect:1.2.1
