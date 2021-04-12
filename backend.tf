terraform {
  backend "s3" {
    bucket = "mybucket000000022"
    key    = "terraform-webapp.tfstate"
    region = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
