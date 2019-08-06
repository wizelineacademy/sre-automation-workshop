aws_region = "us-east-2"

aws_profile = "interviews-provision"

s3_bucket_name = "wizeline-academy-automation"

tags = {
  project     = "static-site"
  environment = "development"
  service     = "s3"
  owner       = "sre@wizeline.com"
  terraform   = "true"
}
