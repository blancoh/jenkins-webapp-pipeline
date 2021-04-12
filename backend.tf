terraform {
  backend "s3" {
    bucket = "mybucket00000002"
    key    = "terraform-webapp.tfstate"
    region = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
