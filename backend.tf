terraform {
  backend "s3" {
    bucket = "blancohappz-webapp"
    key    = "terraform-webapp.tfstate"
    region = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
