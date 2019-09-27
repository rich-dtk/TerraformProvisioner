# Variables

variable "region" {
  default = "us-east-1"
}

variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-07d0cf3af28718ef8"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}

variable "subnet_id" {
  default = "subnet-9a093dc6"
}

variable "security_group_id" {
  default = "sg-0bc45a72e4ed9f573"
}

variable "key_pair_name" {
   default = "richp"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "Test"
}