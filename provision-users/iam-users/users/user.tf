resource "aws_iam_user" "default" {
  count = "${var.users}"

  name = "${var.name}-${count.index}"
}

resource "aws_iam_user_policy" "default" {
  count = "${var.users}"

  name   = "s3-access"
  user   = "${element(aws_iam_user.default.*.name, count.index)}"
  policy = "${element(data.aws_iam_policy_document.default.*.json, count.index)}"
}

data "aws_iam_policy_document" "default" {
  count = "${var.users}"

  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_prefix}-${count.index}",
      "arn:aws:s3:::${var.bucket_prefix}-${count.index}/*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
      "s3:HeadBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_prefix}-${count.index}",
    ]
  }
}

resource "aws_iam_user_group_membership" "default" {
  count = "${var.users}"

  user = "${element(aws_iam_user.default.*.name, count.index)}"

  groups = [
    "${var.group_name}",
  ]
}
