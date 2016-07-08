#!/bin/bash          
MASTER_HOST_OR_IP=$1

docker run --name spark-worker1 -p 8081:8081 -d —net=spark --restart=always driveclutch/spark-standalone worker spark://$MASTER_HOST_OR_IP:7077

docker run --name spark-worker2 -p 8082:8082 -d --net=spark --restart=always -e SPARK_WORKER_PORT=7079 -e / 
SPARK_WORKER_WEBUI_PORT=8082 driveclutch/spark-standalone worker spark://$MASTER_HOST_OR_IP:7077
