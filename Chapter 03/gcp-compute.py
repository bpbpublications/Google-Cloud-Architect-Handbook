from google.cloud import compute_v1

instances_client = compute_v1.InstancesClient()
machine_type = "zones/your-zone/machineTypes/n1-standard-1"
