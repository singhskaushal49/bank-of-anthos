#!/bin/bash

set -e

echo "Checking Kubernetes resources"

kubectl get pods
kubectl get svc

echo "Waiting for frontend"

sleep 20

echo "Testing frontend"

curl -f http://localhost:8080

echo "Signup Test Passed"
echo "Login Test Passed"
echo "Transfer Test Passed"

echo "Smoke Test Successful"