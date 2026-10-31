#!/bin/bash

set -e

echo "Checking Kubernetes Cluster"

kubectl cluster-info

echo "Checking Nodes"

kubectl get nodes

echo "Checking Resources"

kubectl get all || true

echo "Smoke Test Successful"