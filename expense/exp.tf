resource "aws_instance" "frontend" {
  ami                    = data.aws_ami.example.image_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  tags                   = {
    Name = "frontend"
  }
}
resource "null_resource" "frontend" {
  depends_on = [aws_route53_record.frontend]
  provisioner "local-exec" {
    command = <<EOF
cd /home/centos/firstAnsibleProject
git pull
sleep
ansible ${aws_instance.frontend.private_ip}, -e ansible_user=centos -e ansible_password = DevOps321 expense.yml -e service_name=frontend
    EOF
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "frontend1.${var.zone_id}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mysql" {
  ami                    = data.aws_ami.example.image_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  tags                   = {
    Name = "mysql"
  }
}

resource "null_resource" "mysql" {
  depends_on = [aws_route53_record.mysql]
  provisioner "local-exec" {
    command = <<EOF
cd /home/centos/firstAnsibleProject
git pull
sleep
ansible ${aws_instance.mysql.private_ip}, -e ansible_user=centos -e ansible_password = DevOps321 expense.yml -e service_name=mysql
    EOF
  }
}



resource "aws_route53_record" "mysql" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "mysql1.${var.zone_id}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "backend" {
  ami                    = data.aws_ami.example.image_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  tags                   = {
    Name = "backend"
  }
}

resource "null_resource" "backend" {
  depends_on = [aws_route53_record.backend]
  provisioner "local-exec" {
    command = <<EOF
cd /home/centos/firstAnsibleProject
git pull
sleep
ansible ${aws_instance.backend.private_ip}, -e ansible_user=centos -e ansible_password = DevOps321 expense.yml -e service_name=backend
    EOF
  }
}

resource "aws_route53_record" "backend" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "backend1.${var.zone_id}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.backend.private_ip]
}
