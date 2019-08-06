provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

terraform {
  required_version = "~> 0.11"

  # CAREFUL! we are storing the state locally
}

variable "aws_region" {
  description = "the aws region where the resources will be created"
}

variable "aws_profile" {
  description = "the aws profileto be used to create the resources"
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "s3_bucket_name" {}

resource "aws_s3_bucket" "build_artifacts" {
  bucket = "${var.s3_bucket_name}"
  acl    = "public-read"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "AllowPublicRead",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name}/*"
        }
    ]
}
EOF

  versioning {
    enabled = true
  }

  tags = "${merge(var.tags, map("Name", "${var.s3_bucket_name}"))}"
}
