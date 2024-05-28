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
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "ec2-with-eip" {
  ami           = "ami-0b2b4f610e654d9ac"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  # instance = aws_instance.ec2-with-eip.id
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2-with-eip.id
  allocation_id = aws_eip.lb.id
}
  