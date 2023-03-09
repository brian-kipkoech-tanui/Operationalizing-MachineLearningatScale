#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
 dockerpath="bernardo6/mlproj:v1.1.0"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run mlproj \
	--image=bernardo6/mlproj:v1.1.0 \
	--port=80 --labels app=mlproj

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward mlproj 8000:80
