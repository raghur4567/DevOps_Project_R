#!/usr/bin/env bash
set -e

NS="devops-challenge"
APP_NAME="api"

echo "[*] Checking pods in namespace $NS..."
kubectl get pods -n "$NS"

POD_NAME=$(kubectl get pod -n "$NS" -l app=$APP_NAME -o jsonpath='{.items[0].metadata.name}')

echo
echo "[*] Checking container user (should NOT be uid=0)..."
kubectl exec -n "$NS" "$POD_NAME" -- id

echo
echo "[*] Port-forwarding and curling the API..."

# Start port-forward in background
kubectl port-forward -n "$NS" deploy/$APP_NAME 8080:8080 >/tmp/port-forward.log 2>&1 &
PF_PID=$!

# Give port-forward a moment to start
sleep 3

# Curl the app
curl http://localhost:8080 || (echo "curl failed"; kill $PF_PID; exit 1)

# Stop port-forward
kill $PF_PID || true

echo
echo "[*] All checks passed."

