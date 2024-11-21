#!/bin/bash

# Install Istio
istioctl install --set profile=demo

# Create a namespace for the sample application
kubectl create namespace sample-app

# Label the namespace for automatic sidecar injection
kubectl label namespace sample-app istio-injection=enabled

# Deploy the sample application
kubectl apply -f sample-app.yaml -n sample-app
