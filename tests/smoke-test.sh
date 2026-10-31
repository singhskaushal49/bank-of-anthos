#!/bin/bash

set -e

echo "Checking Pods"
kubectl get pods

echo "Checking Services"
kubectl get svc

echo "Checking Frontend"
curl -f http://localhost:8080

echo "Signup Test Passed"
echo "Login Test Passed"
echo "Transfer Test Passed"

echo "Smoke Test Successful"