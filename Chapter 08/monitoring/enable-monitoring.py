# This code snippet demonstrates enabling Cloud Monitoring API for a project.

import googleapiclient.discovery

def enable_cloud_monitoring_api(project_id):
    """
    Enables the Cloud Monitoring API for a Google Cloud project.

    Args:
        project_id: The ID of the Google Cloud project.
    """

    try:
        service = googleapiclient.discovery.build('serviceusage', 'v1')

        # Construct the request body
        request_body = {
            "serviceName": "monitoring.googleapis.com"
        }

        # Make the API call to enable the service
        request = service.services().enable(name=f'projects/{project_id}/services/monitoring.googleapis.com', body=request_body)
        response = request.execute()

        print(f"Cloud Monitoring API enabled for project {project_id}: {response}")

    except Exception as e:
        print(f"Error enabling Cloud Monitoring API: {e}")

# Example usage (replace 'your-project-id' with your actual project ID)
enable_cloud_monitoring_api('your-project-id')
