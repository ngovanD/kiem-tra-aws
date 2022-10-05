resource "aws_instance" "web" {
  ami             = "ami-0f62d9254ca98e1aa"
  instance_type   = "t2.micro"
  key_name        = "${var.keyname}"
  security_groups = ["web_ssh_dangnv"]
  user_data = file("script.sh")
  tags = {
    Name = "nginxphp"
  }

  //Copy folder travel vào thư mục /home/ec2-user/
  provisioner "file" {
    source      = "./phpsite"
    destination = "/home/ec2-user"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
  provisioner "file" {
    source      = "./phpsite.conf"
    destination = "/home/ec2-user/phpsite.conf"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
}