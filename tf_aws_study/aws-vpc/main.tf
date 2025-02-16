resource "aws_vpc" "mydefaultvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "default_vpc"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.mydefaultvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}