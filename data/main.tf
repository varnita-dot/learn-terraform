data "aws_ami" "ami_name" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["713669701478"]
}

