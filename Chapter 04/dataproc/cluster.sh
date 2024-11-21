#!/bin/bash

# Creating a dataproc cluster
gcloud dataproc clusters create my-cluster \
  --region=us-central1 \
  --subnet=default \
  --zone=us-central1-a \
  --master-machine-type=n1-standard-1 \
  --master-boot-disk-size=500 \
  --num-workers=2 \
  --worker-machine-type=n1-standard-1 \
  --worker-boot-disk-size=500 \
  --image-version=1.5-deb9


# Submit a spark job
gcloud dataproc jobs submit spark \
  --cluster=my-cluster \
  --region=us-central1 \
  --class=org.apache.spark.examples.SparkPi \
  --jars=file:///usr/lib/spark/examples/jars/spark-examples.jar \
  -- 1000

# Submit a pyspark job
  gcloud dataproc jobs submit pyspark \
    --cluster=my-cluster \
    --region=us-central1 \
    count-words.py

# Start a hadoop mapreduce job using pre-packaged examples
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar pi 16 1000




