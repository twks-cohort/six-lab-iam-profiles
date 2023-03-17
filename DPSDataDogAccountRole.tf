# module "datadog_integration" {
#   source    = "cloudposse/datadog-integration/aws"
#   version   = "0.16.1"
#   enabled   = true

#   name      = "DataDogAccountRole"
#   host_tags = [
#     "account-id=${var.aws_account_id}",
#   ]
#   integrations               = ["all"]
# }
