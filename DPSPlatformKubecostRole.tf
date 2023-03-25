module "DPSPlatformKubecostRole" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version     = "~> 5.1"
  create_role = true

  role_name                         = "DpsPlatformKubecostRole"
  role_requires_mfa                 = false
  custom_role_policy_arns           = [aws_iam_policy.DPSPlatformKubecostRolePolicy.arn]
  number_of_custom_role_policy_arns = 1

  trusted_role_arns = ["arn:aws:iam::${var.nonprod_account_id}:root"]
}


resource "aws_iam_policy" "DPSPlatformKubecostRolePolicy" {
  name = "DPSPlatformKubecostRolePolicy"
  path = "/"

  policy = jsonencode({
    "Version": "2012-10-17"
    "Statement": [
      {
        "Action": [
          "athena:*",
          "glue:GetDatabase*",
          "glue:GetTable*",
          "glue:GetPartition*",
          "glue:GetUserDefinedFunction",
          "glue:BatchGetPartition",
          "glue:CreateDatabase",
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:ListMultipartUploadParts",
          "s3:AbortMultipartUpload",
          "s3:CreateBucket",
          "s3:PutObject",
          "s3:DeleteBucket",
          "kms:*",
          "s3:Get*",
          "s3:List*",
          "eks:DescribeCluster",
          "iam:*",
          "logs:*"
        ]
        "Effect": "Allow"
        "Resource": "*"
      },
    ]
  })
}
