resource "aws_key_pair" "awskeypair" {
  public_key = file("${path.module}/id_rsa.pub")
  key_name   = var.aws_key_name
}
# module "awskeypair" {
#   source             = "terraform-aws-modules/key-pair/aws"
#   key_name           = "awskeypair"
#   create_private_key = true
# }