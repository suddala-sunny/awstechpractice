# resource "aws_secretsmanager_secret" "IAMusersecret" {
#   name                    = "awsadminsecret_3"
#   recovery_window_in_days = 7
# }

# variable "IAMusersecret" {
#   default = {
#     aws_access_key = "AKIA5FTZE4XG4NNOTPWD"
#     aws_secret_key = "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"
#   }

#   type = map(string)
# }

# resource "aws_secretsmanager_secret_version" "IAMusersecret" {
#   secret_id     = aws_secretsmanager_secret.IAMusersecret.id
#   secret_string = jsonencode(var.IAMusersecret)
# }
 
# data "aws_secretsmanager_secret" "IAMusersecret" {
# #   name = "awsadminsecret_3"
# name = aws_secretsmanager_secret.IAMusersecret.id
# }

# data "aws_secretsmanager_secret_version" "IAMusersecret" {
#   secret_id     = data.aws_secretsmanager_secret.IAMusersecret.id
# }

# output "access_key" {
#   value = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.IAMusersecret.secret_string)).aws_access_key
#   sensitive = false
# }

# output "secret_key" {
#   value = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.IAMusersecret.secret_string)).aws_secret_key
#   sensitive = false
# }

