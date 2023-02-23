FROM confluentinc/cp-kafka-connect-base
MAINTAINER Jens Van Deynse [corilus.be]

COPY kafka-connect.yml /opt/
COPY apache-maven-3.8.6-bin.tar.gz /tmp

USER root
RUN yum install jq -y

RUN tar -xvf /tmp/apache-maven-3.8.6-bin.tar.gz
RUN apache-maven-3.8.6/bin/mvn org.apache.maven.plugins:maven-dependency-plugin:get \
                                                         -Dartifact=io.prometheus.jmx:jmx_prometheus_javaagent:LATEST \
                                                         -Ddest=/opt/prometheus_agent.jar

USER appuser
RUN   confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest

