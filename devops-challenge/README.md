# DevOps Challenge – Project Summary

This project demonstrates deploying a Flask application using Docker, Terraform, Kubernetes, and Helm with full automation and security.

----------------------------------------
Project Structure
----------------------------------------
app/                - Flask application
terraform/          - Creates namespace + resource quota
helm/               - Helm chart for Kubernetes deployment
Dockerfile          - Builds secure non-root Docker image
setup.sh            - Automates build + infra + deploy
system-checks.sh    - Checks if deployment is successful

----------------------------------------
Port 80 Security Solution
----------------------------------------
- Running an app directly on port 80 requires root access (security risk)
- Created a non-root user inside Docker image
- App runs on port 8080 inside the container
- Host port mapped to container port during run: docker run -p 80:8080
- This keeps the container secure and still allows access through port 80

----------------------------------------
Automation
----------------------------------------
./setup.sh performs:
1) Build Docker image
2) Push to registry
3) Terraform apply
4) Helm deploy
5) Run system-checks.sh

----------------------------------------
Validation
----------------------------------------
system-checks.sh verifies:
- Pod is running
- API response is correct
- Container is non-root

----------------------------------------
Final Result
----------------------------------------
- Secure (non-root) Docker container
- Kubernetes deployment using Helm
- Terraform for Infrastructure as Code
- Full deployment automation in one command

