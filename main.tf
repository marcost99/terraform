#sets the module
module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "kabuto-s3"
}