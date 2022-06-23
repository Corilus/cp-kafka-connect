FROM confluentinc/cp-kafka-connect-base
MAINTAINER Jens Van Deynse [corilus.be]

COPY jmx_prometheus_javaagent-0.17.0.jar /opt/
COPY kafka-connect.yml /opt/

USER root
RUN yum install jq -y

USER appuser
RUN   confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest

