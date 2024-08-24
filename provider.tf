#sets the provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.1"
    }
  }
  #sets the local of state
  backend "s3" {
    bucket  = "kabuto-state-bucket-tf"
    region  = "us-east-2"
    key     = "terraform.tfstate"
    encrypt = true
    profile = var.profile_name
  }
}

provider "aws" {
  profile = var.profile_name
}

#sets bucket of state
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  #if command "destroy" be executed this bucket not be destroyed
  lifecycle {
    prevent_destroy = true
  }
}

#sets the resource of versioning of bucket
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  #applies the update for this resource only if the dependency be updated
  depends_on = [
    aws_s3_bucket.terraform_state
  ]
}