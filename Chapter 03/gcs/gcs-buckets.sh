#!/bin/bash

# Set the bucket name
bucket_name="my-new-bucket"

# Create the bucket
gsutil mb gs://$bucket_name

# List the objects in the bucket
gsutil ls gs://$bucket_name
