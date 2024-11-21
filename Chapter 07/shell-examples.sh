#!/bin/bash

# Create a workload identity pool
gcloud iam workload-identity-pools create aws-pool \
    --location=global \
    --description="AWS identity pool"

# Create an AWS provider in the pool
gcloud iam workload-identity-pools providers create-aws aws-provider \
    --location=global \
    --workload-identity-pool=aws-pool \
    --attribute-mapping="attribute.aws_role=google.subject" \
    --attribute-condition="attribute.aws_role=='arn:aws:iam::YOUR_AWS_ACCOUNT_ID:role/YOUR_AWS_ROLE_NAME'"

# Create a service account
gcloud iam service-accounts create my-service-account \
    --display-name="My Service Account"

# Grant the service account permissions to the GCS bucket
gsutil iam ch serviceAccount:my-service-account@YOUR_PROJECT_ID.iam.gserviceaccount.com:roles/storage.objectCreator gs://YOUR_BUCKET_NAME

# Add an attribute condition to map the AWS role to the GCP service account
gcloud iam workload-identity-pools add-attribute-condition \
    --location=global \
    --pool-name=aws-pool \
    --provider=aws-provider \
    --attribute="google.subject" \
    --attribute-value="principalSet://iam.googleapis.com/YOUR_PROJECT_ID/attribute.aws_role/arn:aws:iam::YOUR_AWS_ACCOUNT_ID:role/YOUR_AWS_ROLE_NAME" \
    --condition-title="Map AWS role to GCP service account"
