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

## Port 80 vs Non-Root Challenge – Solution

- Running an application directly on port 80 requires root access, which introduces security risks.
- To avoid running the container as root, we created a non-root user inside the Docker image.
- Instead of binding the app to port 80, we configured it to run on port 8080 inside the container.
- While running the container, we mapped host port 80 → container port 8080 using: docker run -p 80:8080.
- This allows users to access the application through port 80 externally while the container runs safely as a non-root user internally.
- This approach maintains both security and functionality without requiring root privileges.
- We also updated the Dockerfile with proper USER, EXPOSE 8080, and CMD/ENTRYPOINT instructions so the application automatically runs as the  non-root user on port 8080 without manual switching.
