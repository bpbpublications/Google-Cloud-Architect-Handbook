from google.cloud import storage

def create_bucket(bucket_name):
    """Creates a new bucket in Google Cloud Storage."""
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    bucket.create()
    print(f"Bucket {bucket.name} created.")

def list_objects(bucket_name):
    """Lists all the objects in the specified bucket."""
    storage_client = storage.Client()
    blobs = storage_client.list_blobs(bucket_name)
    print(f"Objects in bucket {bucket_name}:")
    for blob in blobs:
        print(f"  {blob.name}")

# Replace with your desired bucket name
bucket_name = "my-new-bucket"

create_bucket(bucket_name)
list_objects(bucket_name)
