# configured aws provider with proper credentials
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA5FTZE4XG4NNOTPWD"
  secret_key = "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"
  #   access_key = "jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.IAMusersecret.secret_string)).aws_access_key"
  # secret_key = "jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.IAMusersecret.secret_string)).aws_secret_key"
}
