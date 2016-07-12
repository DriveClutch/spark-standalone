#!/bin/bash
docker run -v `pwd`/jobs/:/opt/spark/jobs/ --name spark-master -p 8080:8080 --net=spark -d --restart=always driveclutch/spark-standalone master
