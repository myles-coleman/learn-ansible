terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myles_runner" {
  ami                         = "ami-07caf09b362be10b8"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-0a08ae7ce261c179a"]
  subnet_id                   = "subnet-019c03f7b62349192"
  key_name                    = "myles-ansible-key"

  tags = {
    Name        = "myles-aws-runner"
    Client      = "Internal"
    Project     = "DOB"
    Owner       = "Myles"
    Application = "app_server"
    Environment = "test"
  }
}
