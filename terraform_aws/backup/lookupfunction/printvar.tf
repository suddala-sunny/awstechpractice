output "userage" {
  value = "My name is ${var.username} and my age is ${lookup(var.userage, "${var.username}")}"
}