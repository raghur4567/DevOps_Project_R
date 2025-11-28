# DevOps Project – Flask API Deployment

## About This Project
This project is a simple Python Flask API that returns a JSON message.
The goal is to deploy this API to Kubernetes using DevOps tools.

## API Output
When we access the API in the browser or using curl, we get:
{"message": "Hello, Candidate", "version": "1.0.0"}

## Development Steps (Commands to run)

minikube start
./setup.sh
kubectl get all -n devops-challenge
kubectl port-forward -n devops-challenge deploy/api 8080:8080
curl http://localhost:8080

## System Check

./system-checks.sh

This script checks:
- Pod is running
- API response is correct
- Container is non-root

## Project Structure

app/                -> Flask application code
terraform/          -> Namespace + Resource Quota (Terraform)
helm/               -> Helm chart for deployment
Dockerfile          -> Docker image (non-root user)
setup.sh            -> Automates build + infra + deploy
system-checks.sh    -> Validates deployment

## Summary
This project shows:
- Docker containerization
- Terraform for infrastructure automation
- Kubernetes deployment using Helm
- Security best practice (non-root container)
- Automation using Bash scripts

This is a small end-to-end DevOps project, easy to explain in interviews.

