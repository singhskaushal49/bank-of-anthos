#!/bin/bash

set -e

echo "Checking Kubernetes connectivity"

kubectl cluster-info

echo "Checking Nodes"

kubectl get nodes

echo "Checking Namespace Resources"

kubectl get all || true

echo "Smoke Test Successful"