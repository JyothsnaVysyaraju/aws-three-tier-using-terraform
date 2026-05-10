# ==============================
# Terraform Backend Configuration
# ==============================

# Note: This is commented out by default
# Uncomment and configure when you're ready to use remote state


terraform {
  backend "s3" {
    # S3 bucket name for storing state
    bucket = "terraform-jyo-s3-bucket"
    
    # Path to state file within the bucket
    key = "dev/terraform.tfstate"
    
    # AWS region where the bucket exists
    region = "us-east-1"
    
    # Modern locking (replaces deprecated dynamodb_table)
    use_lockfile   = true
    
    # Enable encryption at rest
    encrypt = true
    
    # Optional: Workspace-based state management
    # workspace_key_prefix = "workspaces"
  }
}


# To use the backend:
# 1. Create an S3 bucket for state storage
# 2. Create a DynamoDB table with primary key "LockID" (String)
# 3. Uncomment the above configuration
# 4. Update bucket, key, region, and table name
# 5. Run: terraform init -reconfigure
