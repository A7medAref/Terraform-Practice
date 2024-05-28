variable "ami_version" {
  description = "AMI version of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type of the EC2 instance"
  type        = string
}

variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "instances_partial_names" {
  description = "Partial name of the EC2 instances"
  type        = list(string)
}
  