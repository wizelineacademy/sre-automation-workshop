aws_region = "us-east-2"

# ---- UPDATE THESE VALUES ----

aws_profile = "interviews-provision"

s3_bucket_name = "wizeline-academy-automation-0"

# ---- /UPDATE THESE VALUES ----

tags = {
  project     = "static-site"
  environment = "development"
  service     = "s3"
  owner       = "sre@wizeline.com"
  terraform   = "true"
}
