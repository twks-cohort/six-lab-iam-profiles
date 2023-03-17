# ========= original

# is the plan/apply running against the profiles account?
variable "create_iam_profiles" {
  type     = bool
  default  = false
}

variable "aws_region" {}
variable "assume_role" {}

variable "account_id" {
  type        = string
  sensitive   = true
}

# variable "prod_account_id" {
#   type        = string
#   sensitive   = true
# }

variable "nonprod_account_id" {
  type        = string
  sensitive   = true
}

# variable "datadog_api_key" {
#   type        = string
#   sensitive   = true
# }

# variable "datadog_app_key" {
#   type        = string
#   sensitive   = true
# }


# twdps.io@gmail.com service account gpg public key for encrypting aws credentials
# not a secret, but even public keys can set off secret scanners
variable "twdpsio_gpg_public_key_base64" {
  type        = string
  sensitive   = true
}

# ========= new

variable "is_prod_account" {}
variable "aws_default_region" {}
variable "aws_account_role" {}

variable "aws_account_id" {
  type        = string
  sensitive   = true
}
