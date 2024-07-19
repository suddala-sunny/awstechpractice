resource "aws_default_route_table" "dev_env_public_ig_route_table" {
  default_route_table_id = aws_vpc.dev_env_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_env_ig.id
  }
}