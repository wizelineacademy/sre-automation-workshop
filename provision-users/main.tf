provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

terraform {
  required_version = "~> 0.11"

  # CAREFUL! we are storing the state locally
}

variable "aws_region" {
  default = "us-east-2"
}

variable "aws_profile" {
  default = "interviews-provision"
}

variable "bucket_prefix" {
  default = "wizeline-academy-automation"
}

variable "group_name" {
  default = "wizeline-academy-automation"
}

variable "total_users" {
  default = "5"
}

variable "pgp_key" {
  default = "wizelinedevops"
}

# Since we will duplicate this block, leave erc_name without var
module "users" {
  source = "./iam-users"

  total_users   = "${var.total_users}"
  bucket_prefix = "${var.bucket_prefix}"
  aws_region    = "${var.aws_region}"
  pgp_key       = "${var.pgp_key}"
  group_name    = "${var.group_name}"
}

output "users_prefix" {
  value = "${var.group_name}"
}

output "iam_ids" {
  value = "${module.users.iam_ids}"
}

output "iam_keys" {
  value = "${module.users.iam_keys}"
}
