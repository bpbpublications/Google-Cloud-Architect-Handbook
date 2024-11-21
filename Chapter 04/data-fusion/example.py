from google.cloud import data_fusion_v1beta1

# Initialize Data Fusion client
data_fusion_client = data_fusion_v1beta1.DataFusionServiceClient()

# Define the pipeline configuration
pipeline = {
    "name": "my_first_pipeline",
    "description": "This is a simple example of a Data Fusion pipeline",
    # Other configurations
}

# Create the pipeline
created_pipeline = data_fusion_client.create_pipeline(
    parent="projects/my_project/locations/us-central1/instances/my_instance",
    pipeline=pipeline
)
