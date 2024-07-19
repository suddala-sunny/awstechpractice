resource "aws_vpc" "dev_env_vpc" {
  cidr_block = "10.0.0.0/24"
  tags       = { name = "dev_env_vpc" }
}