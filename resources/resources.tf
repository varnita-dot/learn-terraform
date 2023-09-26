resource "aws_instance" "web" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name = "FirstTerraformEC2"
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z09045272FOIJI3ZIE9SI"
  name    = "terra.varraj20316.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.private_ip]
}
