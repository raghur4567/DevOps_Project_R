output "namespace_name" {
  description = "Name of the Kubernetes namespace used for the challenge"
  value       = kubernetes_namespace.devops_challenge.metadata[0].name
}

output "resource_quota_name" {
  description = "Name of the resource quota applied to the namespace"
  value       = kubernetes_resource_quota.devops_challenge_quota.metadata[0].name
}

