resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


/*
  acl                        = "private"    # Access Control List for the bucket
  force_destroy              = false        # Prevent accidental deletion of non-empty bucket
  versioning {
    enabled                  = true         # Enable versioning for the bucket
    mfa_delete               = false        # Require MFA (Multi-Factor Authentication) for object deletion
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm         = "AES256"     # Server-Side Encryption Algorithm
      }
    }
  }
  lifecycle_rule {
    enabled                   = true        # Enable lifecycle rules
    prefix                    = ""          # Specify prefix for objects to which the rule applies
    enabled                   = true        # Enable the rule
    transition {
      days                    = 30          # Number of days to transition to another storage class
      storage_class          = "GLACIER"    # Target storage class for transition
    }
    expiration {
      days                    = 365         # Number of days after which objects expire
    }
  }
  logging {
    target_bucket             = "my-log-bucket"   # Target bucket for access logs
    target_prefix             = "logs/"           # Prefix for access logs in the target bucket
  }
  website {
    index_document            = "index.html"     # Index document for static website hosting
    error_document            = "error.html"     # Error document for static website hosting
  }
  cors_rule {
    allowed_headers           = ["*"]            # List of allowed headers in CORS requests
    allowed_methods           = ["GET", "PUT"]   # List of allowed HTTP methods in CORS requests
    allowed_origins           = ["*"]            # List of allowed origins for CORS requests
    max_age_seconds           = 300             # Maximum age in seconds for browser to cache preflight response
  }
}
*/