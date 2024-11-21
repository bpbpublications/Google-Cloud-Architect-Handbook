from google.cloud import container_v1

def create_gke_cluster(project_id, zone, cluster_name):
    """
    Creates a GKE cluster with the specified name and basic settings.

    Args:
        project_id: The ID of your Google Cloud project.
        zone: The zone where you want to create the cluster.
        cluster_name: The name of the cluster to create.
    """

    client = container_v1.ClusterManagerClient()

    cluster = {
        'name': cluster_name,
        'initial_node_count': 3,
        # Add more cluster settings as needed
        'node_config': {
            'machine_type': 'e2-medium',
            'disk_size_gb': 100,
            'oauth_scopes': [
                'https://www.googleapis.com/auth/compute',
                'https://www.googleapis.com/auth/devstorage.read_only',
                'https://www.googleapis.com/auth/logging.write',
                'https://www.googleapis.com/auth/monitoring',
            ]
        }
    }

    response = client.create_cluster(
        request={
            'parent': f'projects/{project_id}/locations/{zone}',
            'cluster': cluster
        }
    )

    # Print the cluster details
    print(f"Cluster created: {response.name}")
    print(f"Status: {response.status}")
    print(f"Endpoint: {response.endpoint}")

# Replace with your actual values
project_id = 'your_project_id'
zone = 'your_zone'
cluster_name = 'your-cluster-name'

create_gke_cluster(project_id, zone, cluster_name)
