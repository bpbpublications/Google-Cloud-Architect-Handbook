from google.cloud import bigquery

def stream_data_to_bigquery(project_id, dataset_id, table_id, rows_to_insert):
    """Streams data into a BigQuery table.

    Args:
      project_id: The ID of your Google Cloud project.
      dataset_id: The ID of the dataset.
      table_id: The ID of the table.
      rows_to_insert: A list of dictionaries containing the data to insert.
    """
    client = bigquery.Client(project=project_id)
    table = client.dataset(dataset_id).table(table_id)

    errors = client.insert_rows_json(table, rows_to_insert)
    if errors == []:
        print("Data streamed into BigQuery successfully!")
    else:
        print(f"Errors encountered while streaming data: {errors}")

# Replace with your BigQuery details
project_id = "your-project-id"
dataset_id = "my_dataset"
table_id = "my_table"
rows_to_insert = [
    {"full_name": "John Doe", "age": 30},
    {"full_name": "Jane Doe", "age": 40},
]

stream_data_to_bigquery(project_id, dataset_id, table_id, rows_to_insert)
