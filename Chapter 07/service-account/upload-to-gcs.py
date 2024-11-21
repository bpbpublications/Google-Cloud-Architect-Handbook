from google.cloud import storage

def upload_to_bucket(bucket_name, file_name, service_account_key_path):
    """
    Uploads a file to a Google Cloud Storage bucket using a service account.

    Args:
        bucket_name: The name of the bucket to upload to.
        file_name: The name of the file to upload.
        service_account_key_path: The path to the service account key file.
    """

    storage_client = storage.Client.from_service_account_json(service_account_key_path)
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(file_name)
    blob.upload_from_filename(file_name)

    print(f"File {file_name} uploaded to bucket {bucket_name}")

# Example usage
upload_to_bucket('my-bucket', 'my-file.txt', 'path/to/your/key.json')
