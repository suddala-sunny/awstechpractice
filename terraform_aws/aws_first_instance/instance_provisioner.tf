resource "aws_instance" "dev_env_ec2instance" {
  tags          = { name = "dev_env_ec2instance" }
  ami           = var.aws_image_id
  instance_type = var.aws_instance_type
  key_name      = aws_key_pair.awskeypair.key_name
  subnet_id     = aws_subnet.dev_env_subnet.id
  #vpc_security_group_ids = [ "${aws_aws_security_group.dev_env_sg.id}" ]
  security_groups             = ["${aws_security_group.dev_env_sg.id}"]
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "readme.md"
    destination = "/tmp/readme.md"
  }
  provisioner "file" {
    content     = "this is suddala sunny"
    destination = "/tmp/content.md"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > /tmp/publicip.txt"
  }
  provisioner "local-exec" {
    working_dir = "/tmp/"
    command     = "echo ${self.public_ip} > publicipmy.txt"
  }
  provisioner "local-exec" {
    interpreter = ["python3", "-c"]
    command     = "print('hello world')"
  }
  provisioner "local-exec" {
    on_failure = continue
    command    = "env > envinfo.txt"
    environment = {
      envname = "envvalue"
    }
  }
  provisioner "local-exec" {
    when    = create
    command = "echo 'At Create'"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'At Delete'"
  }
  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/netconfiginfo.txt",
      "echo 'Hello Sunny' > /tmp/test.txt"
    ]
  }
  provisioner "remote-exec" {
    script = "./testscript.sh"
  }
}

output "instance_public_ip" {
  value = aws_instance.dev_env_ec2instance.public_ip
}