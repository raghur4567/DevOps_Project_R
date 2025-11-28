output "namespace_name" {
  description = "The namespace created for the challenge"
  value       = kubernetes_namespace.devops.metadata[0].name
}

output "resource_quota_name" {
  description = "The name of the ResourceQuota"
  value       = kubernetes_resource_quota.memory_quota.metadata[0].name
}

