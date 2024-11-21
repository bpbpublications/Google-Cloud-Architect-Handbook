from google.cloud import datastore

def insert_data(kind, data):
  """Inserts data into a Datastore entity.

  Args:
    kind: The kind of the entity.
    data: A dictionary containing the data to insert.
  """
  client = datastore.Client()
  entity = datastore.Entity(key=client.key(kind))
  entity.update(data)
  client.put(entity)
  print(f"Data inserted into Datastore kind '{kind}'")

# Example usage
kind = "MyEntity"
data = {
    'foo': 'bar',
    'baz': 1337
}

insert_data(kind, data)
