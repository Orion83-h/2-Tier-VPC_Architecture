# cidr range for custom VPC
vpc_cidr = "192.168.0.0/16"

# cidr for all subnets in custom VPC
subnet_cidrs = [
  "192.168.64.0/24",
  "192.168.48.0/24",
  "192.168.32.0/24",
  "192.168.16.0/24"]

# Availability Zones where subnets will be created, both public & private
aws_zones = ["us-east-1a", "us-east-1b"]

# Specified Region to deploy vpc and other AWS resources 
aws_region = "us-east-1"

# Tag for custom VPC
vpc_tag = "Demo_vpc"

# Tag for custom public route table
rt_tag-1 = "Public Route"

# Tag for custom private route table
rt_tag-2 = "Private Route"

# Tag for  custom internet gateway
igw_tag = "Test Igw"


