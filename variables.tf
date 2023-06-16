variable "aws_region" {
  type        = string
  description = "Region to deploy resources"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC cidr renge"
}

variable "aws_zones" {
  type        = list(string)
  description = "Availability Zones to host resources"
}
variable "subnet_cidrs" {
  type        = list(string)
  description = "CIDR's for both public & private subnets"
}

variable "vpc_tag" {
  type = string  
}

variable "igw_tag" {
  type = string
}

variable "rt_tag-1" {
  type = string
}

variable "rt_tag-2" {
  type = string
}