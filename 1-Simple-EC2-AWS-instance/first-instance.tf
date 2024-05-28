terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "github" {
  token = var.github_token
}

resource "aws_instance" "my-first-instance" {
  ami           = "ami-0b2b4f610e654d9ac"
  instance_type = "t2.micro"
}

resource "github_repository" "example" {
  name        = "terraform-first-repo"

  visibility = "private"
}


output "server_ip" {
  value = aws_instance.my-first-instance.public_ip
}

output "github_repo"{
  value = "${github_repository.example.repo_id} ${github_repository.example.git_clone_url}"
}