module "DPSPlatformAWSCloudwatchBaseRole" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version     = "~> 5.1"
  create_role = true

  role_name                         = "DPSPlatformAWSCloudwatchBaseRole"
  role_requires_mfa                 = false
  custom_role_policy_arns           = [aws_iam_policy.DPSPlatformAWSCloudwatchBaseRolePolicy.arn]
  number_of_custom_role_policy_arns = 1

  trusted_role_arns = ["arn:aws:iam::${var.nonprod_account_id}:root"]
}


resource "aws_iam_policy" "DPSPlatformAWSCloudwatchBaseRolePolicy" {
  name = "DPSPlatformAWSCloudwatchBaseRolePolicy"
  path = "/"

  policy = jsonencode({
    "Version": "2012-10-17"
    "Statement": [
      {
        "Action": [
          "kms:Create*",
          "kms:Decrypt",
          "kms:DescribeKey",
          "kms:Encrypt",
          "kms:Generate*",
          "kms:Get*",
          "kms:ListKeys",
          "kms:Put*",
          "kms:List*",
          "kms:ScheduleKeyDeletion",
          "sns:*",
          "lambda:*",
          "ec2:Describe*",
          "logs:Create*",
          "logs:*",
          "iam:CreateRole",
          "iam:GetPolicy",
          "iam:CreatePolicy",
          "iam:Get*",
          "iam:Tag*",
          "iam:Untag*",
          "iam:List*",
          "iam:Delete*",
          "iam:AttachRolePolicy",
          "iam:PassRole",
          "iam:DetachRolePolicy",
          "cloudformation:Describe*",
          "cloudformation:List*",
          "cloudwatch:List*",
          "cloudwatch:GetMetricData",
          "states:DescribeStateMachine",
          "states:ListStateMachines",
          "tag:GetResources",
          "xray:GetTraceSummaries",
          "xray:BatchGetTraces"
        ]
        "Effect": "Allow"
        "Resource": "*"
      },
    ]
  })
}
