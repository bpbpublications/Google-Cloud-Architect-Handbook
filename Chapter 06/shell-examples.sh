#!/bin/bash

# Create a firewall rule to allow HTTP traffic
gcloud compute firewall-rules create allow-http \
    --allow=tcp:80 \
    --target-tags=http-server \
    --description="Allow incoming HTTP traffic"

# Create a static route to an on-premises network via VPN
gcloud compute routes create to-on-premises \
    --destination-range=192.168.0.0/16 \
    --next-hop-vpn-tunnel=my-vpn-tunnel \
    --next-hop-vpn-tunnel-region=us-central1 \
    --priority=1000 \
    --description="Route to on-premises network via VPN"

# Create a Cloud Storage bucket for a website
gsutil mb -acl public-read gs://my-cdn-bucket

# Upload website files to the bucket
gsutil cp -r ./website/* gs://my-cdn-bucket

# Reserve an external IP address
gcloud compute addresses create example-ip \
    --network-tier=PREMIUM \
    --ip-version=IPV4 \
    --global

# Create a backend bucket with Cloud CDN enabled
gcloud compute backend-buckets create my-cdn-backend-bucket \
    --gcs-bucket-name=my-cdn-bucket \
    --enable-cdn

# Create a URL map for the backend bucket
gcloud compute url-maps create http-lb \
    --default-backend-bucket=my-cdn-backend-bucket

# Create a Serverless VPC Access connector
gcloud compute networks vpc-access connectors create my-connector \
  --region us-central1 \
  --subnet my-dev-subnet \
  --subnet-project apple-dev-project \
  --min-instances 10 \
  --max-instances 100 \
  --machine-type e2-standard-8
