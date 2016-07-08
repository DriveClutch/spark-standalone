FROM java:openjdk-8
 
MAINTAINER Sang Venkatraman <sang@driveclutch.com>

ARG __SPARK_DIST_NAME=spark-1.6.2-bin-hadoop-2.6_scala-2.11

RUN apt-get update \
	&& apt-get -y install curl wget bash \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt
WORKDIR /opt
COPY ${__SPARK_DIST_NAME}.tgz .
RUN tar -xvf ${__SPARK_DIST_NAME}.tgz 
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
