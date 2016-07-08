#!/bin/bash
docker run --name spark-master -p 8080:8080 -d --net=spark --restart=always driveclutch/spark-standalone master
