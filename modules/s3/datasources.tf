#filters the data of object specified and save in an object (data source)
#warning: occurs an error of exception if the resource not found
data "aws_s3_bucket" "bucket" {
    bucket = "${var.s3_bucket_name}-${terraform.workspace}"
}