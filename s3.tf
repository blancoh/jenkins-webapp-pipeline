resource "aws_s3_bucket" "terraform_state_s3_bucket" {
    bucket = "dhmf-terraform-storage"
     
versioning {
      enabled = true
    }
     
lifecycle {
      prevent_destroy = false
    }
     
#tags {
 #     Name = "Terraform State File Storage"
  #  }      
}
