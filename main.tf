resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.org_name}-bucket-${terraform.workspace}"

  tags = {
    Name = "First bucket"
    Iac = true
  }
}