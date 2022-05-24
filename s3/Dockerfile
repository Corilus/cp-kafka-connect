FROM confluentinc/cp-kafka-connect-base
MAINTAINER Jens Van Deynse [corilus.be]

USER root
RUN yum install jq -y
RUN yum install gettext -y

USER appuser
RUN   confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest

