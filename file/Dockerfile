FROM confluentinc/cp-kafka-connect-base

USER root
RUN microdnf install -y ca-certificates gzip tar wget && microdnf clean all;

RUN set -eux; \
    install -d -m 0755 /usr/share/filestream-connectors; \
    curl -fSL \
      -o /usr/share/filestream-connectors/connect-file-3.9.0.jar \
      "https://repo1.maven.org/maven2/org/apache/kafka/connect-file/3.9.0/connect-file-3.9.0.jar"; \
    chmod 0644 /usr/share/filestream-connectors/connect-file-3.9.0.jar

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.12/binaries/apache-maven-3.9.12-bin.tar.gz
RUN tar -xvf apache-maven-3.9.12-bin.tar.gz
RUN apache-maven-3.9.12/bin/mvn org.apache.maven.plugins:maven-dependency-plugin:3.9.0:copy \
    -Dartifact=io.prometheus.jmx:jmx_prometheus_javaagent:LATEST \
    -DoutputDirectory=/opt \
    -Dmdep.useBaseVersion=true
RUN mv /opt/jmx_prometheus_javaagent-1.0.1.jar /opt/prometheus_agent.jar

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/usr/share/filestream-connectors"

USER appuser
