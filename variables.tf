
variable "aws_region" {
  description = "AWS region for the EC2 instance"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name used to tag project resources"
  type        = string
  default     = "jenkins-terraform-lab"
}
