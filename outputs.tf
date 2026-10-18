output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IPv4 address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "URL of the test website"
  value       = "http://${aws_instance.web.public_ip}"
}
