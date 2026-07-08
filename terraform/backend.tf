# Remote State Backend Configuration
#
# SECURITY BEST PRACTICES FOR STATE BUCKET:
# - State files contain resource details and can expose secrets
# - The state bucket must be HIGHLY RESTRICTED and encrypted
# - This should only be used for team/shared environments
#
# SETUP INSTRUCTIONS (Team/Production):
# 1. Run `terraform init` WITHOUT this backend (uses local state)
# 2. Run `terraform apply` to create resources
# 3. Create dedicated state bucket with hardening:
#    - Enable versioning: aws s3api put-bucket-versioning --bucket terraform-state-portfolio-site --versioning-configuration Status=Enabled
#    - Enable encryption: aws s3api put-bucket-encryption --bucket terraform-state-portfolio-site --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "aws:kms"}}]}'
#    - Block public access: aws s3api put-public-access-block --bucket terraform-state-portfolio-site --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
#    - Enable MFA Delete (optional but recommended): aws s3api put-bucket-versioning --bucket terraform-state-portfolio-site --versioning-configuration Status=Enabled,MFADelete=Enabled --mfa "device-serial 123456"
# 4. Uncomment the terraform backend block below
# 5. Update bucket name, region, and dynamodb_table to match your environment
# 6. Run `terraform init -migrate-state` to migrate local state to remote
#
# CLEANUP ON DESTROY:
# - DO NOT delete the state bucket automatically
# - Manually delete old state versions before deletion
# - Consider keeping the state bucket as a backup
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
