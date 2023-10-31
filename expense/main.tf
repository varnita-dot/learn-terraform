data "aws_ami" "ami_name" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["713669701478"]
}

data "aws_security_group" "security_group_name" {
  id = sg-061c2870eae3922b5
}

data "aws_route53_zone" "zone_id" {
  name         = "Z09045272FOIJI3ZIE9SI"
  #private_zone = true
}