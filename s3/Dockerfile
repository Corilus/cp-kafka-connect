FROM confluentinc/cp-kafka-connect-base
MAINTAINER Jens Van Deynse [corilus.be]

COPY kafka-connect.yml /opt/

USER root
RUN yum install jq -y

RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
RUN tar -xvf apache-maven-3.8.6-bin.tar.gz
RUN apache-maven-3.8.6/bin/mvn org.apache.maven.plugins:maven-dependency-plugin:get \
                                                         -Dartifact=io.prometheus.jmx:jmx_prometheus_javaagent:LATEST \
                                                         -Ddest=/opt/prometheus_agent.jar

USER appuser
RUN   confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest

