#!/bin/bash

# Create a subnet in us-central1 region
gcloud compute networks subnets create my-subnet \
    --network my-network \
    --range 10.0.1.0/24 \
    --region us-central1

# Create a firewall rule allowing ingress traffic on TCP port 80
gcloud compute firewall-rules create my-firewall-rule \
    --direction=INGRESS \
    --priority=1000 \
    --network=my-network \
    --action=ALLOW \
    --rules=tcp:80 \
    --source-ranges=0.0.0.0/0

# Set up a VPC peering connection
gcloud compute networks peerings create my-peering \
    --network my-network \
    --peer-network other-network \
    --auto-create-routes

# Create a more secure SSH firewall rule
gcloud compute firewall-rules create secure-ssh-rule \
    --direction=INGRESS \
    --priority=1000 \
    --network=my-vpc \
    --action=ALLOW \
    --rules=tcp:22 \
    --source-ranges=203.0.113.0/24 \
    --target-tags=ssh-secure

# Create a VM instance with the secure SSH tag
gcloud compute instances create my-secure-vm \
    --network-interface=network=my-vpc,subnet=my-subnet,tags=ssh-secure

# Enable IAP for an App Engine application
gcloud services enable iap.googleapis.com
gcloud iap web enable \
    --resource-type=app-engine \
    --oauth2-client-id=YOUR_CLIENT_ID \
    --oauth2-client-secret=YOUR_CLIENT_SECRET

# Start an IAP tunnel to a VM instance
gcloud compute start-iap-tunnel my-vm 22 \
    --zone us-central1-a \
    --local-host-port=localhost:22

# Create a Cloud VPN gateway
gcloud compute target-vpn-gateways create my-vpn-gateway \
    --network my-network \
    --region us-central1

# Create a Dedicated Interconnect
gcloud compute interconnects create my-interconnect \
    --location interconnect-location \
    --capacity 10Gbps \
    --interconnect-type DEDICATED

# Configure a subnet to enable Private Google Access
gcloud compute networks subnets update my-subnet \
    --region=us-central1 \
    --enable-private-ip-google-access

# Create a custom metric descriptor in Cloud Monitoring
gcloud monitoring metrics-descriptors create \
    --description="Description of your metric" \
    --type="custom.googleapis.com/my_custom_metric" \
    --metric-kind=GAUGE \
    --value-type=INT64 \
    --labels="key=value"
