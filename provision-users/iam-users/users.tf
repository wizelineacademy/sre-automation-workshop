module "users" {
  source = "./users"

  name          = "${var.group_name}"
  bucket_prefix = "${var.bucket_prefix}"
  group_name    = "${var.group_name}"
  users         = "${var.total_users}"
  pgp_key       = "${var.pgp_key}"
}

output "iam_ids" {
  value = "${module.users.iam_id}"
}

output "iam_keys" {
  value = "${module.users.iam_key}"
}
