resource "aws_instance" "frontend" {
  ami = data.aws_ami.ami_name.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.security_group_name]
  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.zone_id
  name    = "frontend1.varraj20316.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

#resource "aws_instance" "mysql" {
#  ami = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = ["sg-061c2870eae3922b5"]
#  tags = {
#    Name = "mysql"
#  }
#}
#
#resource "aws_route53_record" "mysql" {
#  zone_id = "Z09045272FOIJI3ZIE9SI"
#  name    = "mysql.varraj20316.online"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.mysql.private_ip]
#}
#
#resource "aws_instance" "backend" {
#  ami = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = ["sg-061c2870eae3922b5"]
#  tags = {
#    Name = "backend"
#  }
#}
#
#resource "aws_route53_record" "backend" {
#  zone_id = "Z09045272FOIJI3ZIE9SI"
#  name    = "backend1.varraj20316.online"
#  type    = "A"
#  ttl     = 300
#  records = [aws_instance.backend.private_ip]
#}
