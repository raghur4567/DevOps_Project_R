#!/usr/bin/env bash
set -e

echo "[*] Checking deployment in namespace devops-challenge..."
kubectl get pods -n devops-challenge

echo "[*] Checking service..."
kubectl get svc -n devops-challenge

echo "TODO:"
echo " - Check container runs as non-root"
echo " - Check port 80 exposed correctly"
echo " - Check curl response"

