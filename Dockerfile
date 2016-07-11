FROM driveclutch/alpine-java:1.0

MAINTAINER Sang Venkatraman <sang@driveclutch.com> 

USER root

ARG __SPARK_DIST_NAME=spark-1.6.2-bin-spark-1.6.2-hadoop-2.6-built-java8-scala2.11

RUN mkdir -p /opt
WORKDIR /opt
COPY ${__SPARK_DIST_NAME}.tgz .
RUN tar -zxvf ${__SPARK_DIST_NAME}.tgz 
RUN mv ${__SPARK_DIST_NAME} spark

COPY scripts /opt/spark/docker-scripts

WORKDIR spark

RUN chmod -R +x /opt/spark/docker-scripts

ENV PATH=/opt/spark/bin:/opt/spark/sbin:$PATH \
  SPARK_MASTER_PORT=7077 \
  SPARK_MASTER_WEBUI_PORT=8080 \
  SPARK_WORKER_PORT=7078 \
  SPARK_WORKER_WEBUI_PORT=8081

EXPOSE 6066 7077 7078 8080 8081

#VOLUME ["/opt/spark/conf", "/opt/spark/work"]

ENTRYPOINT ["/opt/spark/docker-scripts/entrypoint.sh"]
CMD ["master"] 
