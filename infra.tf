resource "aws_s3_bucket" "terraform_state" {
  bucket = "osayd-io-terraform-state"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  
  tags = {
    project = "terraform"
  }
}
