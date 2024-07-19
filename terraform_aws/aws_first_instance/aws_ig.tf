resource "aws_internet_gateway" "dev_env_ig" {
  tags   = { name = "dev_env_ig" }
  vpc_id = aws_vpc.dev_env_vpc.id
}