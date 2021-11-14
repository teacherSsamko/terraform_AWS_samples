variable "ec2_name" {
  type    = string
  default = "test-ec2"
}

variable "ami_ubuntu" {
  type    = string
  default = "ami-036d46416a34a611c" // ubuntu 20.04 LTS
}

variable "ami_amazon_linux2" {
  type    = string
  default = "ami-0e5b6b6a9f3db6db8" // Amazon Linux 2
}
