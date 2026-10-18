variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name used for project resources"
  type        = string
  default     = "jenkins-terraform-lab"
}

variable "allowed_ssh_cidr" {
  description = "Trusted IPv4 CIDR allowed to SSH to the instance"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.allowed_ssh_cidr))
    error_message = "Provide a valid IPv4 CIDR, such as your public IP followed by /32."
  }
}
