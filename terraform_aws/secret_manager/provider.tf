# configured aws provider with proper credentials
provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
  #   access_key = "jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.IAMusersecret.secret_string)).aws_access_key"
  # secret_key = "jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.IAMusersecret.secret_string)).aws_secret_key"
}
