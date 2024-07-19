variable "userage" {
  type = map(string)
  default = {
    "suddala" = 20
    "sunny" = 30
    "rao" = 40
  }
  description = "print user age"
}
variable "username" {
  type = string
}
