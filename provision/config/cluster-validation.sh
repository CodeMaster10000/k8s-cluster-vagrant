#!/bin/bash

# the minimum requiered number of pods in kube-system namespace in Running state
DESIRED_COUNT=10

wait_for_cluster() {

  while true; do
    
    # Excluding Completed pods from the check as they are not expected to be in Running state
    RUNNING_COUNT=$(kubectl get pods -n kube-system --field-selector=status.phase=Running | grep -c '1/1\s*Running')
    echo "Currently $RUNNING_COUNT kube-system pods are running and ready out of $DESIRED_COUNT."
    if [[ $RUNNING_COUNT -lt $DESIRED_COUNT ]]; then
        echo "Waiting for all kube-system pods to be running..."
        sleep 30
    else
        echo "All kube-system pods are running or completed."
        break
    fi
  done

}

# Wait for the k8s cluster to be up and running
wait_for_cluster