variable "aws_region" {
  default = "us-east-1"
}

variable "ecr_image_uri" {
  description = "Your ECR image URI (e.g. 123456789012.dkr.ecr.us-east-1.amazonaws.com/my-repo:latest)"
  type        = string
}
