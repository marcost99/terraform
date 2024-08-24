#sets variables of output conform data source especified
output "bucket_domain_name" {
  value       = data.aws_s3_bucket.bucket.bucket_domain_name
  sensitive   = false
  description = "Name of domain of bucket"
}