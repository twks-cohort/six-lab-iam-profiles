locals {
  # this example repo only uses a single non-production account, however typically there would be
  # four or more accounts in a more complete implementation
  nonprod_roles = [
    "arn:aws:iam::${var.nonprod_account_id}:role/*"
  ]

  all_roles = [
    "arn:aws:iam::${var.nonprod_account_id}:role/*"
  ]
}

# members of the nonprod service account group can assume any role in any non-production account
module "DPSNonprodServiceAccountGroup" {
  count = var.create_iam_profiles ? 1 : 0
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version = "~> 5.1"

  name = "DPSNonprodServiceAccountGroup"
  assumable_roles = local.nonprod_roles
  group_users = [
    module.DPSNonprodServiceAccount.iam_user_name
  ]
}


# In the simplified model, a single non-production service account is created since
# initially a single platform team is responsible for all platform account infrastructure
module "DPSNonprodServiceAccount" {
  create_user = var.create_iam_profiles
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 5.1"

  name                          = "DPSNonprodServiceAccount"
  create_iam_access_key         = true
  create_iam_user_login_profile = false
  pgp_key                       = var.twdpsio_gpg_public_key_base64
  force_destroy                 = true
  password_reset_required       = false
}

output "DPSNonprodServiceAccount_aws_access_key_id" {
  value = var.create_iam_profiles ? module.DPSNonprodServiceAccount.iam_access_key_id : ""
  sensitive   = true
}

# gpg public key encrypted version of DPSSimpleServiceAccount aws-secret-access-key
output "DPSNonprodServiceAccount_encrypted_aws_secret_access_key" {
  value = var.create_iam_profiles ? module.DPSNonprodServiceAccount.iam_access_key_encrypted_secret : ""
  sensitive   = true
}

