resource "aws_s3_bucket" "terraform_state_s3_bucket" {
    bucket = "blancohappz-terraform-storage"
     
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
