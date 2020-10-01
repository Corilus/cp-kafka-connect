FROM confluentinc/cp-kafka-connect
MAINTAINER Jens Van Deynse [corilus.be]

COPY plugins/* /usr/share/java/connect-plugins/
