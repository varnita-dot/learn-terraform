data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

data "aws_security_group" "sg" {
  name = "allow-all"
}

data "aws_route53_zone" "zone" {
  name         = var.zone_id
  #private_zone = true
}

variable "zone_id" {
  default = "varraj20316.online"
}


