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

# data "aws_ami" "ami_datasource" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }
# }

resource "aws_security_group" "allowing_ssh_and_port_80" {
  name = "allowing_ssh_and_port_80"

  dynamic "ingress" {
    for_each = [22, 80]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2-with-eip" {
  ami             = "ami-0b2b4f610e654d9ac"
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allowing_ssh_and_port_80.name]
  key_name        = "terraform-testing"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-testing.pem")
    host        = self.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      // nginx
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
}
