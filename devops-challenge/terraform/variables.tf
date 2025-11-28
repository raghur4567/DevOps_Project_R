variable "namespace_name" {
  description = "Kubernetes namespace for the challenge"
  type        = string
  default     = "devops-challenge"
}

variable "memory_limit" {
  description = "Total memory limit for the namespace"
  type        = string
  default     = "512Mi"
}

