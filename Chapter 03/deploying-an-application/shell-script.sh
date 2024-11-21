#!/bin/bash

# Deploy the Nginx application
kubectl apply -f nginx-deployment.yaml

# Wait for the deployment to roll out
kubectl rollout status deployment nginx-deployment

# Scale the deployment to 5 replicas
kubectl scale deployment nginx-deployment --replicas=5

# Get the external IP of the service
echo "Waiting for service to get assigned an external IP..."
kubectl get service nginx-service --watch | grep -m 1 "EXTERNAL-IP"

# Print the external IP
EXTERNAL_IP=$(kubectl get service nginx-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "Nginx application is accessible at: http://$EXTERNAL_IP"
