# create public subnet az1
resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [0]
  availability_zone       = "${var.aws_zones}" [0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-az1a"
  }
}

# create public subnet az2
resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [1]
  availability_zone       = "${var.aws_zones}" [1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-az1b"
  }
}

# create private subnet az1
resource "aws_subnet" "private_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [2]
  availability_zone       = "${var.aws_zones}" [0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-az1a"
  }
}

# create private subnet az2
resource "aws_subnet" "private_1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.subnet_cidrs}" [3]
  availability_zone       = "${var.aws_zones}" [1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-az1b"
  }
}

