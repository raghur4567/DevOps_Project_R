#!/usr/bin/env bash
set -e

echo "[*] Building Docker image..."
docker build -t devops-challenge-api .

echo "[*] Applying Terraform..."
cd terraform
terraform init
terraform apply -auto-approve
cd ..

echo "[*] Deploying with Helm..."
helm upgrade --install api ./helm/api -n devops-challenge

echo "[*] Done."

