#!/bin/bash
docker run -v /Users/sang/Software/spark/spark-1.6.2/spark-docker/spark-standalone/jobs/:/opt/spark/jobs/ --name spark-master -p 8080:8080 --net=spark -d --restart=always driveclutch/spark-standalone master
