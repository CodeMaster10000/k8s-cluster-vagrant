#!/bin/bash
source /vagrant/environment.properties

# Validate cluster health
sudo bash /vagrant/provision/config/cluster-validation.sh

# Install Reloader
kubectl apply -f /vagrant/provision/k8s/components/reloader/reloader.yaml