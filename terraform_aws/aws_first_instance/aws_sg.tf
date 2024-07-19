resource "aws_security_group" "dev_env_sg" {
  #resource "aws_default_security_group" "dev_env_sg" {
  vpc_id      = aws_vpc.dev_env_vpc.id
  description = "aws sg ssh allow"
  # ingress {
  #   description = "port 22 for ssh allow"
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "port 80 for http allow"
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "port 443 for https allow"
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "port 3306 for mysql allow"
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "port 27017 for mongodb allow"
  #   from_port   = 27017
  #   to_port     = 27017
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "port 1521 for oracledb allow"
  #   from_port   = 1521
  #   to_port     = 1521
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  dynamic "ingress" {
    for_each = var.aws_ports
    iterator = port
    content {
      description = "inbound port allow for security group"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = [0]
    iterator = port
    content {
      description = "outbound port allow for security group"
      from_port   = port.value
      to_port     = port.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}