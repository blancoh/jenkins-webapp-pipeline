terraform {
  backend "s3" {
    bucket = "mybucket0000001"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt        = true
    dynamodb_table = "dynamo"
  }
}
#resource "aws_s3_bucket" "terraform-bucket-alex" {
#  bucket = "terraform-bucket-alex"
#  acl = private
#
#  tags = {
#    Name = "My terraform bucket"
#    Environment = "dev"
#  }
#
#}
