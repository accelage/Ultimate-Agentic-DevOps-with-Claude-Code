# Remote State Backend Configuration
#
# INITIAL SETUP INSTRUCTIONS:
# 1. First, run `terraform init` WITHOUT this backend configuration (it will use local state)
# 2. Run `terraform apply` to create all resources
# 3. Create an S3 bucket to store the Terraform state (e.g., terraform-state-${aws_account_id})
# 4. Enable versioning on the state bucket for safety
# 5. Uncomment the terraform backend block below
# 6. Update the bucket name and region to match your state bucket
# 7. Run `terraform init -migrate-state` to migrate from local to remote state
#
# CLEANUP ON DESTROY:
# - Remember to manually delete the state bucket (S3 prevents bucket deletion if not empty)
#
# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-portfolio-site"
#     key            = "terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
