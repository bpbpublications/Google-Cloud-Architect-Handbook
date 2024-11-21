#!/bin/bash

# --- BigQuery ---
# Create a Cloud Logging sink for BigQuery
gcloud logging sinks create my-bigquery-sink bigquery.googleapis.com/projects/my-project/datasets/my-dataset

# Link the sink to specific log entries
gcloud logging sinks update my-bigquery-sink --log-filter='resource.type="cloud_run_revision" AND severity>=WARNING'


# --- Dataproc ---
# Create a Dataproc cluster with Stackdriver logging enabled and linked to the BigQuery sink
gcloud dataproc clusters create my-cluster \
    --enable-stackdriver-logging \
    --logging-sink my-bigquery-sink


# --- Dataflow ---
# Run a Dataflow job with Stackdriver logging enabled and linked to the BigQuery sink
gcloud dataflow jobs run my-job \
    --enable-stackdriver-logging \
    --logging-sink my-bigquery-sink


# --- GKE ---
# Create a GKE cluster with Stackdriver logging enabled and linked to the BigQuery sink
gcloud container clusters create my-cluster \
    --enable-stackdriver-logging \
    --logging-sink my-bigquery-sink


# --- Vertex AI ---
# Create a Cloud Logging sink for Vertex AI logs
gcloud logging sinks create my-vertex-ai-sink bigquery.googleapis.com/projects/my-project/datasets/my-dataset
