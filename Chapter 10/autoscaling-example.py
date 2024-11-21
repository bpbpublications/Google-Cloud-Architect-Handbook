# This code snippet demonstrates setting up autoscaling for a managed instance group.

def set_autoscaling(instance_group_name, max_num_replicas, target_cpu_utilization, cool_down_period, zone):
    """
    Sets autoscaling for a managed instance group.

    Args:
      instance_group_name: The name of the managed instance group.
      max_num_replicas: The maximum number of replicas.
      target_cpu_utilization: The target CPU utilization.
      cool_down_period: The cool-down period in seconds.
      zone: The zone where the managed instance group is located.
    """
    try:
        # Construct the gcloud command using f-string formatting
        command = f"gcloud compute instance-groups managed set-autoscaling {instance_group_name} \
            --max-num-replicas {max_num_replicas} \
            --target-cpu-utilization {target_cpu_utilization} \
            --cool-down-period {cool_down_period} \
            --zone {zone}"

        # Execute the command (replace this with actual execution logic)
        print(f"Executing command: {command}")
        # ... (code to execute the command and handle output) ...

    except Exception as e:
        print(f"Error setting autoscaling: {e}")

# Example usage (replace with your actual values)
set_autoscaling(
    instance_group_name="my-instance-group",
    max_num_replicas=10,
    target_cpu_utilization=0.6,
    cool_down_period=90,
    zone="us-central1-a"
)
