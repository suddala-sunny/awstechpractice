resource "aws_subnet" "dev_env_subnet" {
  vpc_id            = aws_vpc.dev_env_vpc.id
  tags              = { name = "dev_env_subnet" }
  availability_zone = var.aws_availability_zone
  cidr_block        = "10.0.0.0/26"
}