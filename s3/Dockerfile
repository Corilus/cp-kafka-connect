FROM confluentinc/cp-kafka-connect-base
MAINTAINER Jens Van Deynse [corilus.be]

USER root
RUN yum install jq -y

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.tar.gz
RUN tar -xvf apache-maven-3.9.0-bin.tar.gz
RUN apache-maven-3.9.0/bin/mvn org.apache.maven.plugins:maven-dependency-plugin:get \
                                                         -Dartifact=io.prometheus.jmx:jmx_prometheus_javaagent:LATEST \
                                                         -Ddest=/opt/prometheus_agent.jar

USER appuser
RUN   confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest

