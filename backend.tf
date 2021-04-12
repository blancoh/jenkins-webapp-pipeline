terraform {
  backend "s3" {
    bucket = "jenkins-webapp-pipeline"
    key    = "terraform-aws/terraform-webapp.tfstate"
    region = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
