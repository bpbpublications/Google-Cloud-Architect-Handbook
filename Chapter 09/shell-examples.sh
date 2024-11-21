#!/bin/bash

# Create a new Cloud Source Repository
gcloud source repos create my-repo

# Clone the repository to your local machine
gcloud source repos clone my-repo my-repo-directory

# Build and push a Docker image to Container Registry
docker build -t gcr.io/my-project/my-app .
gcloud docker -- push gcr.io/my-project/my-app

# Deploy the container image to a Kubernetes cluster
kubectl apply -f deployment.yaml
