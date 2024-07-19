output "printusername" {
//  value = "My name is ${var.userlist[2]}"
  value = "My name is ${join(" ",var.userlist)}"
}

output "uppercase" {
  value = "${upper(var.userlist[0])}"
}