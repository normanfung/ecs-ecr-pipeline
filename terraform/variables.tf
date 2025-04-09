variable "aws_region" {
  default = "us-east-1"
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "ecr_repository_url" {
  type    = string
  default = "255945442255.dkr.ecr.us-east-1.amazonaws.com/norman-3.4-repo"
}
