#sets variables of output conform output of module
output "bucket_domain_name" {
  value       = module.s3.bucket_domain_name
  sensitive   = false
  description = "Name of domain of bucket"
}