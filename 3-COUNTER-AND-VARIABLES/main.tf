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

resource "aws_instance" "ec2-with-eip" {
  ami           = var.ami_version
  instance_type = var.instance_type
  count         = 3
  key_name      = "${var.instances_partial_names[count.index]}-key"
}

resource "aws_eip" "eip" {
  count    = 3
  instance = aws_instance.ec2-with-eip[count.index].id
  vpc      = true
}