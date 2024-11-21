from googleapiclient import discovery

def restart_instance(event, context):
    """
    Restarts a Compute Engine instance.

    Args:
      event: The event data.
      context: The context object.
    """

    project = 'your-project-id'
    zone = 'us-central1-a'
    instance = 'your-instance-name'

    service = discovery.build('compute', 'v1')
    request = service.instances().reset(project=project, zone=zone, instance=instance)
    response = request.execute()

    print(f"Instance restart requested: {response}")

# Example usage (replace placeholders with your actual values)
restart_instance(None, None)
