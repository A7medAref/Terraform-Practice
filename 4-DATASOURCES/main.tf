terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.38.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}


data "aws_ami" "ami_datasource" {
  most_recent = true
  owners      = ["amazon"]
}

resource "aws_instance" "ec2-with-eip" {
  ami           = data.aws_ami.ami_datasource.id
  instance_type = var.instance_type
  count         = 3
  key_name      = "${var.instances_partial_names[count.index]}-key"
}
