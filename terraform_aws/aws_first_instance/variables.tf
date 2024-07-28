variable "aws_ports" {
  type = list(number)
}

variable "aws_image_id" {
  type = string
}

variable "aws_instance_type" {
  type = string
}

variable "aws_key_name" {
  type = string
}

variable "aws_availability_zone" {
  type = string
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "aws_region" {
  type = string
  #default = "ap-south-1"
}

# variable "aws_ami_image_name" {
#   type = string
# }