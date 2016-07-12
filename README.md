##Building the custom spark distribution and docker image (USUALLY NOT NECESSARY)

###Building custom version of the spark distribution. 

Since http://spark.apache.org/downloads.html does not have the versions we need, we need to do the following steps.

The steps are in http://spark.apache.org/docs/latest/building-spark.html
 
i) Clone the Apache Spark source code from https://github.com/apache/spark 

ii) At the root of the directory, Run the following command to change Scala to version 2.11

    ./dev/change-scala-version.sh 2.11

iii) The following command builds a tgz file in the root of the directory

    ./make-distribution.sh --name spark-1.6.2-hadoop-2.6-built-java8-scala2.11 --tgz -Psparkr -Phadoop-2.6 -Dhadoop.version=2.6.2 -Dscala-2.11 -Phive

###Building the docker image

Clone this repository. At the root of this repo, drop the custom spark distribution tgz file. Then run (don't forget the . at the end)

    docker build -t driveclutch/spark-standalone .

##Pull the published docker image (recommended approach)

i) Pull the docker image

    docker pull driveclutch/spark-standalone
    
###Run containers for master, workers and submit job

####Run the following scripts to run a master container, 2 workers and submit a test job to master

	./recreate_spark_network.sh
    
	./start_master.sh  (and then go to http://localhost:8080 and get the <MASTER_IP> from the url)
    
	./start_workers.sh <MASTER_IP>
	
####Submit a simple job to calculate the value of pi to master
    
	./submit_job.sh

####Submit an actual spark job (this uses code in a private repository and you may not have access to that)

	./submit_fvp.sh <MASTER_IP>

##Environment Variables

Spark reads environment variables in start script so we can adjust the variables to change ip/ports. Please see http://spark.apache.org/docs/latest/spark-standalone.html#cluster-launch-scripts for the available variables.

Basically, this docker image set default values to the following variables:-

	SPARK_MASTER_PORT=7077
	SPARK_MASTER_WEBUI_PORT=8080
	SPARK_WORKER_PORT=7078
	SPARK_WORKER_WEBUI_PORT=8081

