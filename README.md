#Spark 1.6.2 (Standalone)

##Build the image

docker build -t driveclutch/spark-standalone .

##Run the following scripts to run a master container, 2 workers and submit a job to master
./recreate_spark_network.sh
./start_master.sh
./start_workers.sh
./submit_job.sh


###Submit an SparkPi example from any node

	docker exec -it spark-worker /opt/spark/bin/spark-submit --master spark://${MASTER_HOST_OR_IP}:7077 /opt/spark/examples/src/main/python/pi.py 10

##Environment Variables

Spark reads environment variables in start script so we can adjust the variables to change ip/ports. Please see http://spark.apache.org/docs/latest/spark-standalone.html#cluster-launch-scripts for the available variables.

Basically, this docker image set default values to the following variables:-

	SPARK_MASTER_PORT=7077
	SPARK_MASTER_WEBUI_PORT=8080
	SPARK_WORKER_PORT=7078
	SPARK_WORKER_WEBUI_PORT=8081

