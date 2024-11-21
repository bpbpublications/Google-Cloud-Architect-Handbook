#!/usr/bin/env bash

PROJECT_ID=test-project-001
REGION_NAME=us-central1
ZONE_NAME=us-central1-a
INSTANCE_NAME=n2d-standard-4-node-1
CLUSTER_NAME=k8-cluster-01

# Authentication:  - Log in to your GCP account:
gcloud auth login

# List authenticated accounts:
gcloud auth list

# Projects:   - Set the active project:
gcloud config set project PROJECT_ID

# List all projects:
gcloud projects list

# Compute Engine:  - Start an instance:
gcloud compute instances start INSTANCE_NAME

# Stop an instance:
gcloud compute instances stop INSTANCE_NAME

# Kubernetes Engine: - Get cluster credentials:
gcloud container clusters get-credentials CLUSTER_NAME

# Info & Configuration:- Get active configuration details:
# gcloud config list

# Set default region and zone:
gcloud config set compute/zone ZONE_NAME
gcloud config set compute/region REGION_NAME
